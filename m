Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 339008B4DA8
	for <lists+samba-technical@lfdr.de>; Sun, 28 Apr 2024 21:42:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=W7B77MMYlzqldg99ccBq2wH+c+UxOC4I7BCkF7uClEg=; b=f6tfb9b24fKq3UX26Kqds7tC5w
	rX8GKdf/LE9gRDTw3giArJLSv/L6Aqw2ClEriP2SbT9xJn8BwDLu5Tg3nJ/VUf8Nq41R23bGRfy2v
	kTMgthQOUZwHY8RU49Mkg7Lh5pOQnXKPGgIv1qiducbkd3/3HhyjNzJH4aHbqVWJ96bTa1HNY77DY
	JVdtRKW3mL9b9Np585oK4AotLwyNHWPHOqszmoEFDk18vPiv2VaAhLweoEF8pH9lMoLS5Z169PkLV
	xuK7bk0fndhe3Le3HZqxkbup35fKOCw0m34zAeNoEZca+3ly3hctfGSZ607DPIR6EVraDRBpshGFi
	CVqdLzTg==;
Received: from ip6-localhost ([::1]:42480 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s1AOy-005wqH-Iw; Sun, 28 Apr 2024 19:41:32 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:49403) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1AOt-005wqA-OY
 for samba-technical@lists.samba.org; Sun, 28 Apr 2024 19:41:30 +0000
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2db6f5977e1so43054301fa.2
 for <samba-technical@lists.samba.org>; Sun, 28 Apr 2024 12:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714333282; x=1714938082; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=W7B77MMYlzqldg99ccBq2wH+c+UxOC4I7BCkF7uClEg=;
 b=FahVaIT8YGaPgM6n5657qcWovWi2SSTJY7/o6PxNo735dlMYAXZeahmQyxobyn793R
 VKox5mR2HR1KyExR7shTPmSWxTGXlKqtIpf3/R0ap4ZljQQ/SX8uaHYv/3od23+SDl0L
 1Wf0J+AUbtYCCiH+vwPi2fbz2VsEzTQTj2lLO1fxM8FyO8QFjjZoMzA9MaTlrSB1q3fW
 IhgWZlfM8i4ZiGoB2zKOn6O91xZ7lmsx9ST1dn6CkLDJnAWIuxbL5LrxMqdIwrKaN3ue
 2CM45naRahYqh6Su4hpdVkqT7NBvBtmDhr2LPjNrVLqq+2WPmG/HoDc1PR2KOxwM6AWB
 4OWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714333282; x=1714938082;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W7B77MMYlzqldg99ccBq2wH+c+UxOC4I7BCkF7uClEg=;
 b=fUQkVHsIGNH6ESBNqdt9kB80M3guj8JQ8ygB2Ksob7jmRiOULJAUx0b1A1g5Qw0/lH
 RhDHoOjN8FbrQloJJvS2vdXD2fi2pz/u/DAL4SYcKYhwy53PTaDyVuwOQE9E815sBd83
 limk3oGYDBLjCqiwOjHg33KsSKfpGbvxwyF9T81anqlgLU4VEmd+Lqz5o5C2EZwHygPK
 lxbXEQs+MRupLowjScEj/3IbbXVdowo4GNYV9J9jfHow/0KOm+a8qXuGKPcbT2sclS0G
 FkVMDepLElGf2pJZiJk5vHZ8IAlwNjEi1bsHzRhGGodwhKuot7xGLmQt10zXyIEmCCog
 Lqzw==
X-Gm-Message-State: AOJu0Yx2m+ZNZnOKXbTXmrAcFlUxneWb/u/xF3L2dSiwbVqsUjcFigsJ
 HvzuigKBKW6jev4Ofo/vGZFNeYJamDaug4F6cF/VMs7F9S/nPzfji8RZKW9EPPCv5d4FBwb2dM0
 VEG+GTNDIzy//iN5oXXmpKAU3U3KfbwHw
X-Google-Smtp-Source: AGHT+IE6VvUGnTLqRBWdNKVOHLHKEmUQk6ZMzPtL7KAkCL9afFg8yqmmf1rDIsuZT3TRSqXP0LgsV5wU/W3tc2+AnUA=
X-Received: by 2002:ac2:46cd:0:b0:519:2828:c284 with SMTP id
 p13-20020ac246cd000000b005192828c284mr4667717lfo.65.1714333281863; Sun, 28
 Apr 2024 12:41:21 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 28 Apr 2024 14:41:10 -0500
Message-ID: <CAH2r5muXqpZN1mu=WAhaxXe0yRB7Rib_CaoGo3h15wwcSPZFuw@mail.gmail.com>
Subject: Samba ctime still reported incorrectly
To: samba-technical <samba-technical@lists.samba.org>
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
Cc: CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I did another test of the Samba server ctime bug on Samba master
(4.21.0pre1) and Samba server is still broken in how it reports ctime.
An example scenario is simple, creating a hardlink is supposed to
update ctime on a file (and this works fine to Windows server and
ksmbd etc) but Samba server mistakenly reports ctime as mtime (unless
you mount with the "posix" mount option).  This e.g. breaks xfstest
generic/236 when run to Samba

More information is at:
https://bugzilla.samba.org/show_bug.cgi?id=10883

-- 
Thanks,

Steve

