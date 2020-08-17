Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD1B24680A
	for <lists+samba-technical@lfdr.de>; Mon, 17 Aug 2020 16:10:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=PfeG+YW+MwilzqSDm9jlVQh/pHElv94kwk40IZch1DQ=; b=GQdz1ArNt7QvRiqPx2deo5seRi
	JBrjYEZcme3Ztvrbx8ZzUjyfW8xoOfH3Jo8qHpyfSGvOLgy2JruBFoEUE/bfY423I+b5Etp7Bx76N
	8Rj+lbSuy02rZN3CA4fHZnQwj/Uy957JRuWwBrm9jmMhGhJLH1fFJ26t1wUZruJq2d4L2X/hIuLBj
	oao53QZJdUEqQQ9G60uazF1b8Kp4Wku1rMHR21pAKuLetw9c2ulWxQstIDOYeMMHNejJ/Eh2y8EgQ
	AbD6rtZ0YkHIQg6D/82VOp8X/5R1CBiDK7SY0nhAUV/o0elX0KVo9ZR36bRg5xGTDwINNbS+dceMw
	qEgUvAWQ==;
Received: from localhost ([::1]:21704 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k7fpV-00E7dT-6u; Mon, 17 Aug 2020 14:09:41 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:33991) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k7fpP-00E7dM-WB
 for samba-technical@lists.samba.org; Mon, 17 Aug 2020 14:09:38 +0000
Received: by mail-ej1-x62e.google.com with SMTP id o23so17941105ejr.1
 for <samba-technical@lists.samba.org>; Mon, 17 Aug 2020 07:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=vliBerlUyg76N+Rl/94UKS1XCb/uMRpWJTogL8PilX8=;
 b=Q4uCb0djfN9lImrUGFL7sQLA7vFyqhYU0gpQpUSNirlC69jtuzxH/yXLyQxJ9YztKu
 t7yEiXoWpSqqZnvuCf5b/K8x9stu1OjuRJJIP+tNxwEgrC0IwO8hW5AJ1cWBJddV7SYo
 N6Oe4DjLwjKYA1lSkkTCEauEr9+5n5YFnrG35ip30XGUoN5rIaU4QZZblSAMwfiMD9L8
 CIVmKmgoeTzwtioy92tCp1eT5+HOz4NR52knOyCe69HCvvdj5eGZW+X7+nr3ZH3qQon1
 sJPzV1Hgu5Cyd6oQlqe1xd9rHjApafi/Eo8XHhTH16p/u+t8YBqjUBR+2UkzER+azi+6
 svJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=vliBerlUyg76N+Rl/94UKS1XCb/uMRpWJTogL8PilX8=;
 b=ZeH90d54m7kJSnKNcpvGN0z4PtyM6PGrcrGkUwlFDztRNygW9eLzFIW/hDh3hipDrh
 gsB0UxfRIkDjdJP/4+zUo0rDQVhMLF+pFqwCOqjrWbhj6FSBIsThcL3ylW6ZhGi9z4PF
 NM7v7Nyj+weFs/GNW7b5oxb1smTJEVHezpT0eb9UqkmeP+91teCFjJYCXNvUmyW4Swvm
 J6hGPKDHDHM1A9jvWM9a3QD5DWw/WwgTVfPp39PobEHuodkSxru2S6m/weXYyy59Ujqb
 Y+HyaaBq4r8IN1qICFgkDekRM6Ly1nVHYh4O6Fo9bXAtkbi0SGfvcdDd2bS0zsGJzZyR
 QSYA==
X-Gm-Message-State: AOAM530Lc6JdWB5InewrLy9vW4mLSRD2ip9jY3ECSea7Fqfg9ClHIyq8
 +2jg3jnc0sDElPIOm8qNIJU0Veb6Kz4amwHhsm2UGOr2GMl7lw==
X-Google-Smtp-Source: ABdhPJxsicllGaZ6oTlYK/zD4qg6X3JABd/hZ6qMKB2B8mIAz7u/aqCsFDEcF+6Mxspp/h2OhYKbXvZgj8G2sVz0qsY=
X-Received: by 2002:a17:907:2712:: with SMTP id
 w18mr15137703ejk.473.1597673374284; 
 Mon, 17 Aug 2020 07:09:34 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 17 Aug 2020 05:09:23 -0900
Message-ID: <CAH72RCX3G1ZLP8Gvm0ATgvnvJ+p2t2a8rtOtiZ4HRAWPggFXsQ@mail.gmail.com>
Subject: GSoC Progress Update
To: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>,
 Abacus <hello@abacus.co.ke>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: hezekiah maina via samba-technical <samba-technical@lists.samba.org>
Reply-To: hezekiah maina <hezekiahmaina3@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello everyone,

Over the past week I worked on the Debian distributions (Ubuntu 20.04 and
Debian 10) packaging for the project.
You can find the instructions for installing the latest plugin version in
Fedora 32, Ubuntu 20.04 and Debian 10 here:
https://gitlab.com/HezekiahM/samba-ad-dc/-/blob/master/README.md
