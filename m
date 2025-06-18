Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B3747ADF964
	for <lists+samba-technical@lfdr.de>; Thu, 19 Jun 2025 00:25:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=KxQhDubABj6uaLJxZ4q28EQg9L/Fekhes499ywIf55U=; b=4EQzrZVkHlSU0hoe/Zz2I9/OJb
	1enG54kpYNag2qUnSEYSsQuTbLNm9xfDcrKlsiJ7W1m7PwCXQteFVPAyeQIRgXX+suoN7QS1RJ4ge
	Ih5nGsO3pYlJdqtjFifh01XyvZwBd3cfNDpjw2OpO+zUwsS4wLXyQ3zmA3s4h1K5ZMMDVrP2Y1az0
	2Oxfs+ek105svZPqXVRjb06JwNoB4ptv0yPy9f/ZoOEYmiXJ2vIrHK8GpIFJNhL2CdJFNgiqPimIx
	TRT6v+8JKOhD67tC55KgFHA/p1WNEVxcYvgN33UZrAyVB9jIc6oYoPd+94ShCzF07VP/x3C2ZcT4I
	71wpqCBQ==;
Received: from ip6-localhost ([::1]:62728 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uS1D7-007PLF-0d; Wed, 18 Jun 2025 22:24:49 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:53616) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uS1D2-007PL8-Ul
 for samba-technical@lists.samba.org; Wed, 18 Jun 2025 22:24:47 +0000
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-553b60de463so104385e87.3
 for <samba-technical@lists.samba.org>; Wed, 18 Jun 2025 15:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750285484; x=1750890284; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=KxQhDubABj6uaLJxZ4q28EQg9L/Fekhes499ywIf55U=;
 b=l/RcvjG/Kt6mtIKx7ZMZcDCgnsS5eh+Va/UV7LkQPexOjIXWc9vBRr0gWXJsy2GOxh
 1neD4MsPA7x1ugh6ymOFe0hD2/zUALHDKxYebcTSgAZaI42cyM/96h/htBym4X2dfiUY
 vaKib1rraJx4JS4FLA2TOtpVLtDM58CitxfjBQmf78We27XG4z+eD/m4Z8AeG9UHMcxp
 QPMwoS7IuvDsDKqk5bb46w51T8J4jKpi0R0htphp969Q9SJQDJ6ep/q6XrAw+eCk+ubt
 hoRg5W4Br/R/och1hspdlR2zhi4VmdaVcLa8+di+Rd4IpEpuq4nNplmsO1D6Pnrx5xeQ
 9WyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750285484; x=1750890284;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KxQhDubABj6uaLJxZ4q28EQg9L/Fekhes499ywIf55U=;
 b=oYzE/5p1IP13FXAJJSBAiMauvkz8lyqueQxUvZol6JJirkcRilbkEh6e6T1nnL0BLF
 h5gJPZQnvoa8+uW2z4eJBGWPQAxnCPnpg+RXFfRqX2MiE4vZ5xfOQjy62liDxFW4Wa1N
 JgQiIbZQD49L50Ll46xhP8S+jhFgNUPcloIBpgVNRWhvkioblzhAlHgUR0dldyhNYNmP
 GtWTBow4q6Kp9K3WAwjRlmJ1HynmFIqLPl4d4T4hdtDlqg7NndD63nZrPRVKwpZmp4zs
 XOgiuSTZXV/GiczzMtz7Axax43Mbe5sf+I/+abMEa75IuvaR6X+nijo+Nem4r5HQ74cB
 1lTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEcug7HY08atK09+gyOjhNtE1FnyfPslZrwQD4PhlvkyIXaFL3GgwoK+IrGeOQfas3wyP0fbHDD6vmHIWgIfs=@lists.samba.org
X-Gm-Message-State: AOJu0Yw19l/blusrcs/oDw58ShQJ9/R+ChItpihZdB4XWSDVPnx6yxs1
 py2+xp6VP26Ja6cykJJSOEEd9+3BjCfDeGXLXAG70RpYQBoH9++h/ko0KDJ7nhgCalontniSG+d
 cd5v7EmwBadycEMlJD9OrswPSLdfTI8k=
X-Gm-Gg: ASbGncvOk9tFadDvfKRq09XEO4Wdib1RNv2gaKZ0+b3EfeW5sN1u9BW8KMff9lXzWfo
 kxjEnuZEQnTsotTcHT9pjVmkOqSFca0k83x28uh8lo7xbAAHuG2i6vfhtN04S5lIrjK5t8WIJjO
 k7LTaMdSE0oRbdxazZoqXthqqkuPG66UYQja6b6XzVL3m2IG6Pk2v/zuqfST6LFSMWmItuFlDeu
 fRG5A==
X-Google-Smtp-Source: AGHT+IFKWkYleReGlaDeMZSGoeOcdHTZI6FuBSdm7IoLx/5YW/44/CL3YqGcIw2DYFpNrlozaeE4fxezGa538frgb8E=
X-Received: by 2002:a05:6512:3b13:b0:553:d573:cd6b with SMTP id
 2adb3069b0e04-553d573d055mr980556e87.10.1750285483500; Wed, 18 Jun 2025
 15:24:43 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 18 Jun 2025 17:24:31 -0500
X-Gm-Features: AX0GCFsVWtBmDqxDregn5D43skKGu3Get2qHilpdUKL1gYfeC-e0WYlzVJdgdmI
Message-ID: <CAH2r5mtipm8KB+FwzYKAvNqH4ECAv+1+SUqyZ0ur6k6Sy8KoAA@mail.gmail.com>
Subject: smb 3.1.1 client dir lease performance
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>,
 Bharath S M <bharathsm@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Bharath,
I noticed that with your patch we are caching directories (when server
supports directory leases) well for successive readdirs which is a
great perf improvement but I also noticed that they time out at 30
seconds from when the first readdir was issued (when the dir lease was
first acquired) and not delayed if the directory is requeried every
few seconds.

Thoughts about bumping the timeout on a directory lease
experimentation to when it was last accessed instead of when it was
acquired?

I also noticed that when we hit the limit on max_cached_dirs (16 by
default) instead of evicting the oldest entries in the cache to use
the newest dir leases we give up adding cached_dir for that
when we hit the limit, even though some of the older dir leases in the
cache may be about to expire?  Maybe we should replace the oldest
entry in dir cache with one from newest dir lease

Thoughts?
-- 
Thanks,

Steve

