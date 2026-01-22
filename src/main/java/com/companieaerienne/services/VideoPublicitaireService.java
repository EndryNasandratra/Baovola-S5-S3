package com.companieaerienne.services;

import com.companieaerienne.entities.VideoPublicitaire;
import com.companieaerienne.repositories.VideoPublicitaireRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class VideoPublicitaireService {
    
    @Autowired
    private VideoPublicitaireRepository videoRepository;
    
    public List<VideoPublicitaire> findAll() {
        return videoRepository.findAll();
    }
    
    public List<VideoPublicitaire> findAllActives() {
        return videoRepository.findAllByActifTrue();
    }
    
    public Optional<VideoPublicitaire> findById(Long id) {
        return videoRepository.findById(id);
    }
    
    public List<VideoPublicitaire> findBySociete(Long societeId) {
        return videoRepository.findBySocieteIdOrderByDateCreationDesc(societeId);
    }
    
    public List<VideoPublicitaire> findActiveBySociete(Long societeId) {
        return videoRepository.findBySocieteIdAndActifTrue(societeId, true);
    }
    
    public VideoPublicitaire save(VideoPublicitaire video) {
        if (video.getId() == null) {
            video.setDateCreation(LocalDateTime.now());
        }
        return videoRepository.save(video);
    }
    
    public void deleteById(Long id) {
        videoRepository.deleteById(id);
    }
    
    public void toggleActif(Long id) {
        Optional<VideoPublicitaire> videoOpt = videoRepository.findById(id);
        if (videoOpt.isPresent()) {
            VideoPublicitaire video = videoOpt.get();
            video.setActif(!video.getActif());
            videoRepository.save(video);
        }
    }
}
