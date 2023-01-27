Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E069B67ED3A
	for <lists+samba-technical@lfdr.de>; Fri, 27 Jan 2023 19:14:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=U5Vrw2SJvUooexc5HegKY3IZ+8DOPkBX8ReR72W2HPw=; b=gubUQlpa7bn5KNvM4eKnb5tLaE
	mDC0hZIchDXqjDlR8L2gMTOTdGLKj1W2jP5IjsiIwhffrfBI4iZgniYCPO9Nerkip7aKT3cqRG9N4
	JOwVbqcgOg11KpZ5+/n3/OyCrDrK5QSOGfShlacjcMYEORCGYCxkItAwPfiNf85Z8LYobf7PyUZ8K
	1jORwZ1F6Ar03anuR/AhNZXA4TlILk9liJDaalahbZXlMHM8irJYoC/J++8S1FuLq4czYhueq9DE/
	nmuNTPnA6j4E3Chk12Fhpq0sNXsL+SDdkvwxnJAW7evs7FZbezf3aTrecPX4K2/pp+zNpC20FdF4Z
	YCzihXqw==;
Received: from ip6-localhost ([::1]:34388 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pLTF8-003l0R-TC; Fri, 27 Jan 2023 18:14:30 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:33666) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pLTF4-003l0G-5V
 for samba-technical@lists.samba.org; Fri, 27 Jan 2023 18:14:28 +0000
Received: by mail-qk1-x733.google.com with SMTP id p22so2755811qkm.0
 for <samba-technical@lists.samba.org>; Fri, 27 Jan 2023 10:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=EeTtnTRNoZpcHB2xw80AT9GpBFcY+9JGdaOF++Lmbqo=;
 b=L40M82+8pHjJhfHdY7t3Fp9Pf7m0sFf4t/QVn3iNTIILpBHuG3+UpoqA81yOteOgsc
 kkCEuQNNOQOEARchZ65srixh4J8twQp+tzBGqbOu9gN/j0F3dnPTE8SVOMWLn+c/DcvW
 +HZBgbkeqfJItKORvU57wmnqQICDEetvRk0qeanaEBFmHxgvKWhIazKCfCSs8tCi3D5D
 +at+oQSumdyBdT1C75HF3+lpm4G7AYQneQMtT8OwpcPF0HUStT+jsmcY85Se3gzGhmmQ
 61k9LIF7cn+Qp5on3goEesQEyTsHU+gBPVtwmh2bBoTq4wOQQOQzElGmLYh3kkSJR+zy
 JqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EeTtnTRNoZpcHB2xw80AT9GpBFcY+9JGdaOF++Lmbqo=;
 b=4Cg1bqXn5Iy/bwR/Bl5xId9ToVNogFsoqIPQplPzjWWkMvdyM2/ZTGsKylXJmHSk3U
 T8DV0Uan9XYOsFhpleK63Arw54BM0xRLwNmeF4cXUbC4pUBEotfGjlNzXSXjgYC2/Szl
 JpMN5M1A+s9/B5vDfd4DayZk8S8XUNFkDCGFIPt2V8b4FbPd5ur5ePF1gN172D3S+NHP
 TB/hJzHfmJ86+gFmczofYXibSU+aqE8K9K2hxdFTVeIlG4iSmOdzExgV0ZM85+70JijS
 AKaSFmiiUbBO6TN4M5F5N+LbLM45eVUC/wm2duJMGgg2Ow0LrUmyRb7+TXIvifNQPYgc
 waqQ==
X-Gm-Message-State: AFqh2kqPdJMKiivMyB6YhvfhlAQbYodIRLADwV+jUy5iHtXSWs1lupUe
 U/2a7Mn1VWUIYz1ex3Ne2CxjwhJoy4QtaxU2u9DIXL9uALg=
X-Google-Smtp-Source: AMrXdXtksck24xfBpY1Hjj1/kZn31ztUVVj690qDyADl9N1v9LGvBShAFJ0OHWKg22P05HxiTLlwlnbtrcSHyfo4ASc=
X-Received: by 2002:a05:620a:46a7:b0:708:f4c2:8b89 with SMTP id
 bq39-20020a05620a46a700b00708f4c28b89mr1018425qkb.212.1674843264002; Fri, 27
 Jan 2023 10:14:24 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 27 Jan 2023 23:44:07 +0530
Message-ID: <CA+RDaRC68P7Sfa80X9Z6VFyYnrvoxvC-hLGh=X6BQuXJW9jO8w@mail.gmail.com>
Subject: Does the CreateDisposition flag of a client depend on Server's
 response ?
To: samba-technical@lists.samba.org
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
From: varun mittal via samba-technical <samba-technical@lists.samba.org>
Reply-To: varun mittal <vmittal05@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi

We are observing this behavior with Robocopy on Windows 10, where the same
client behaves differently against 2 different versions of Samba -
Samba-4.4.4(Centos)
v/s Samba-4.9.5-Debian
We have set the max protocol to SMB2.

It sets FILE_OPEN for 4.4.4 and FILE_OPEN_IF with 4.9.5 for the directory
Our VFS module performs its own ACL checks which is misbehaving with the
FILE_OPEN_IF flag

While we are trying to fix our ACL checks to handle this, I am trying to
understand why would a client want to change that flag

The SMB2 spec says that the application decides the CreateDisposition flag.
Since the client is same in both cases, is there something in the initial
responses by the server that would cause this ?

Thanks
Mittal
