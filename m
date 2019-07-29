Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 18915786F9
	for <lists+samba-technical@lfdr.de>; Mon, 29 Jul 2019 10:04:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=WRH+csW3SvFCRnfo6qokQ6+5s5jFeVcPuplxiYuS1pM=; b=vpPSApEIp/UTqtFYrZc0iSMwS2
	9kVR+3fv/D9V6tZR9glcfn1VIraf2OulgTSXu6r7a5PMWhJ0XsrcAWBou3Au3UdEiVatra3/QU5lU
	WdDZV9F3CJL8nErJ5GZ492Ke54l9ZHGm48jqQ/4QwihGH0Ns69ZGvyq7Qcn9UYLFCOf7W/05hhWVH
	XAsEDxhLKmZktf9vzs+NEngagFiL/HP8BSXxmYSfb1K9VyYSuZ5UEWB4zdp6j6XeWUKOSN/xEUg5W
	mg3x/U54yJKyrSBQCrSKf5ZbI7/lZ4+/fhgTJ233BRfC4K5Q39Ii5fwhYghCXNwkdcAjUSKf7+rO6
	iD+i/wMQ==;
Received: from localhost ([::1]:25746 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hs0dD-000gFE-Cx; Mon, 29 Jul 2019 08:03:43 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:40394) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hs0d7-000gF6-Tf
 for samba-technical@lists.samba.org; Mon, 29 Jul 2019 08:03:40 +0000
Received: by mail-lj1-x232.google.com with SMTP id m8so24042103lji.7
 for <samba-technical@lists.samba.org>; Mon, 29 Jul 2019 01:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=bZ49Oppo8GyN5xoLB7ooB0MSkGDzCTO4TcALRdoLtX8=;
 b=tYhZJsWolqreHvNEF1gdsfWSnvHvjhY7xaHK1fIgJF33JxfnsiQRAE1ye9HqlxZe1Y
 Ln7ponzRWMw3t2OhQO5myqCkxGXI95hjNMULdGrj1KguOIN69nx7fymHCOtPOp7t2b67
 3EpFQOTWsg9HG4o5IR0fijnoxUvEdEcZuUBlqvl2P+RDQeYtGK0IO0xTDFzQuIx9FRwg
 z4C7017UwoM8PGNChlle2CJanTZWkwCPYOKBD9z80sv74eiZoXWwv1XR/RjSiqzcFErX
 cS375sApiSuRZxHFMoBITNs/kqsFS/J8YWgAZHjtkW/JYDZNDUGfZqPOrn6XilJPuVPq
 KHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=bZ49Oppo8GyN5xoLB7ooB0MSkGDzCTO4TcALRdoLtX8=;
 b=mFc8hg8Ir30ofOyYdJYZ92AcomsXmMPZkKMYT5+DiNP+plwUBx4Lig65r3Lhv81wQA
 2BR8dcCliLxcMcT2e0/OnUlkH7AYxF/ge87ktoQakQuX9qgjtiiQd8WNiX/6NI1lHMmo
 LWbRunx73z5OTX+6qybRlaoqig8sify+TRgZc5fAz4CEzrt/6V9SV39zdcB9jdjk46pl
 A6cDiLPLFwBG9j9jTTeOoFAvEapVHGaLF8JlVQbqGUwOYdVoXesHYkt/+Yj+65jxfoUQ
 9ZqC5iuV+4T2hdXyiYahZWzQ7ubacyxFGDphHx2UPQz8Fd2CG/ROWT/UTpPo9q6uGoLJ
 KO0A==
X-Gm-Message-State: APjAAAW7psGJmc1vK5jRdE3Jeb5iYk1LdDOiia8GracaHc8hsNzTenIv
 FczyhMLeaDG3JyWOLw5faJi3XakWwmRjokMvyn2pJQ==
X-Google-Smtp-Source: APXvYqzWZ9Vw7o/QIo8elSyMAb9m4B0n+WbznfOd+R5PyZncCXOxeWGVA2AQ5+5+YOsgXBk+ysks1PrPEuoHm4yYgsA=
X-Received: by 2002:a2e:968f:: with SMTP id q15mr14861893lji.30.1564387416790; 
 Mon, 29 Jul 2019 01:03:36 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 29 Jul 2019 09:03:25 +0100
Message-ID: <CAELK94dQHwWgAwsWiRagCK-phs8SH1+LXw2gFW+ypi0L4W4nhQ@mail.gmail.com>
Subject: GSOC 2019 : Improve smbcmp week 6 & 7
To: P Mairo via samba-technical <samba-technical@lists.samba.org>
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
From: P Mairo via samba-technical <samba-technical@lists.samba.org>
Reply-To: P Mairo <akoudanilo@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello, here is a summary of my activities for these weeks :
- Rectified multiple bugs with my solution
- Worked on a new diffs formatting
- Made a few test with encrypted packets
- Test captures with sample captures files sent by my mentor
- Add ignore filter for ignoring some fields
- Tested Solution using compound packets
- Removed xmldiff python library because it doesn't really manage compound
packets
- Refactor code with proposed solution of my mentor
- Changed direction of the project from the original proposal :
Implementation of a GUI

For the last point, with my little experience in multiplatform GUI
programming with python, I felt I had 3 legit choices :
- wxpython
- tkinter
- Pyside 2 aka Qt for python
All the three are open source
I chose wxpython because it's well documented (unlike pyside 2 - at least
for the moment), with a relatively not bad looking UI (unlike Tkinter).
I'll be glad to have your thoughts about this point.
Cheers.

-- 
https://github.com/RMPR
