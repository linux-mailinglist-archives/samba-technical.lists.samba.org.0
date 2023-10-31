Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2777DC4E1
	for <lists+samba-technical@lfdr.de>; Tue, 31 Oct 2023 04:32:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=2QdS7u2TWgcah9K813sHX1aJKtKY38tlLEWWtZYjS5Q=; b=ZqjpD2Dfg1frJBQVjkXF/NhrYu
	3121DBFhu6U1CwAbGe6xzDLw7zX07oAXRwOcp2mAwNSFl/KIw/XKwdjGkuHEoRk/BACQv1AYP0paO
	UBIewLetBGS4I9SmXjQvppsSQoIGr3xuSWG2RReyzWpNaFi2WFsafUkvBTmXHtOL6moQGIJD7w6L3
	U0ryJPbp5Ds+oh6IjzZIezo4FO5HwGdx1IjevNgo6nMnClDt8+i0qM+Xex6F76Z3/QdP9p46SUbxi
	RA+PV4AiNs0J04O73NyKA1yZu7awlfVk0dhvmUbiLPvcjd1PFbjBXGEtFV0zw8RA3hi8bIR/N5AmR
	qHxo0AUA==;
Received: from ip6-localhost ([::1]:40698 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qxfTi-003eMx-UG; Tue, 31 Oct 2023 03:31:43 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:54285) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qxfTd-003eMo-LX
 for samba-technical@lists.samba.org; Tue, 31 Oct 2023 03:31:41 +0000
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-507a3b8b113so7516910e87.0
 for <samba-technical@lists.samba.org>; Mon, 30 Oct 2023 20:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698723096; x=1699327896; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=2QdS7u2TWgcah9K813sHX1aJKtKY38tlLEWWtZYjS5Q=;
 b=M6xFr81bKfLmOtrhX1SmD0nvWvYc3wWSyp9uDxO4vUE80tdbW31RRBZ03PKlYmw+Xv
 9delWNko80Xep9r6w3RLdlLQlxJ/MG0/QysmASXFoG1ie4U/1pjQzK2mFlTlbQ8GTQVb
 tQKmuosp8nmDo+YIL3P6IOLYQLKYI0VDdIuBpkcqb2fggnpaO4hfbZVurRRHyJ23wqP9
 XamDpTf2pzGVtG0lQArb5hsOdh92sRbqWAYfqPN8DS8JuanN784RKJwx2S0xRgxya3RI
 mGmVIP7o7joClRs12yNVVoyq/erci2EwvGWLH2A+LBwkHRbHeUw17rlssvAtXmdp9fTk
 BQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698723096; x=1699327896;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2QdS7u2TWgcah9K813sHX1aJKtKY38tlLEWWtZYjS5Q=;
 b=g8rUJnLb3LV0/lp1n8t4v4bjUvC6llW7WXn2vQUQXQwJBkcFODZB7kc/yV6Kj7dxyc
 BnC6zbj0apZmGMkGIKERAuIGcemEFaRMVNbNmZrGvaDXY/EGeeKT77OPxn+a/9KCcWDl
 1QSQKOzEzIswiYyBG6B4lqBNLTG5VaOCdP4Cjdjg+i3LSW3UlWoVwQDulpTwS58tNGCx
 VkCrP2tar6iCG8DMF2B+No7bypMIE93OmeGdoTkYIH7Bi+j21bgKRnnvuVDes3mQU1md
 dBYi8PTAGqwqYSHUbyUynJo7DqhZXEF3DZ1GA5bdRM9Df7rCUCPCOtrEAeLZHfjXI3qz
 HXvA==
X-Gm-Message-State: AOJu0Yza1T62l3l0ln7PRlmSuspLTsanne2srf0s5uI+IJnC7BEGO+WK
 q2sZfDRNtlQe8xbBYTX3rO5TbLLbxqkYxlCTq2t5IaGJZi6Kkw==
X-Google-Smtp-Source: AGHT+IGxAWXT9YCOlVvZSXeDrjsrImfw3LFAp5+/imFqqn5Ma6ldzPpvU9eqj0kBdawbI+ExeEXB24CMHDx6U0T51is=
X-Received: by 2002:a19:5204:0:b0:500:780b:5bdc with SMTP id
 m4-20020a195204000000b00500780b5bdcmr7842046lfb.49.1698723095873; Mon, 30 Oct
 2023 20:31:35 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 30 Oct 2023 22:31:24 -0500
Message-ID: <CAH2r5mthWZsX8rwMW-r8CTymWDkGTWeaD8v6n_Wyp1=BPmeqhQ@mail.gmail.com>
Subject: Linux SMB3 client quality improvements
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
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

Have been running a large set of xfstests against various server types
and comparing where we were earlier this year with now - and see big
improvements.

Here are some examples from cifs.ko to Samba server e.g. - comparing
the 6.3 kernel from earlier this year to the current 6.6 kernel.    10
additional tests pass:

No longer skipped: generic/051, 068, 390, 491
No longer failed: generic/049, 069, 434, 474, 505, 524

But ... we do have to check carefully, it looks like we do have two
intermittent failures (mount/umount busy regressions due to deferred
close) that were introduced after 6.3:
New failures: 046, 048

Thank you Paulo, Shyam, Bharath and others for helping work through
some of these.  From my investigations it looks like we should be able
to get 20 to 30 additional test groups (from xfstests, the standard
filesystem functional test suite) passing with a series of minor fixes
and features.

Good progress ...
-- 
Thanks,

Steve

