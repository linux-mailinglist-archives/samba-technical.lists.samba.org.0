Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFDC6EDAF2
	for <lists+samba-technical@lfdr.de>; Tue, 25 Apr 2023 06:44:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Q//kii23FKRzCG/0pybaXM8J980UgD3/Gh6plkgpeCk=; b=LvUKamNOOyP19yJ2JqT4mUlbwT
	DOciznJG8lycr/4WkAKD0hQkLHVw1LROSHIL/sMKe/4jOdGIYnPn1w++WIhOGE2GwGeP59i0I2Kmn
	hbX9ThFZ7lrCHYRWOEnc8UXy7nMWvwIqpkM5ZQSfludCAwIpM4DCkyIl9U5DDKurBWbg//pJ7MGST
	E36oSTrpmcMOVjzOS2nu/H+C/oMxKOtElYRc6PczIoCZDiyQ6E+1CvaqeM4O6t4dPOYw4gD5wszh7
	CQYPfE8GLAtQQrxJvvLIvXW62IuX7hgWLjVarwrrhNzyZxnnMuxwq9r52G5rcEoIoCbv73fw146B9
	6S1a4iPA==;
Received: from ip6-localhost ([::1]:34322 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1prAWp-003xvW-7Z; Tue, 25 Apr 2023 04:43:47 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:55789) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1prAWj-003xvN-Mn
 for samba-technical@lists.samba.org; Tue, 25 Apr 2023 04:43:44 +0000
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2a8bbea12d7so51411471fa.3
 for <samba-technical@lists.samba.org>; Mon, 24 Apr 2023 21:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682397819; x=1684989819;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Q//kii23FKRzCG/0pybaXM8J980UgD3/Gh6plkgpeCk=;
 b=ZvjkoPKprG7Mh4FlXuKeC7O7qi4+QefG3GcEdadxcRuWNLaDfrgE14iKE8RnypAawi
 lhuPGwWb6DM0qn9h5GOjbc4pUjWUdimLADOtaMFVQWHjOXjC91+VTzXWezIW8ozFDLCn
 J2ooUOG/LziziuwAf/Z7sbZP/f+0jcfAfw7/mY9vxjzMQYNa28erKwd+4j+UIXzdstsr
 rSO//VB5rtUaw6zw5R/bKdk0k4wo1LEV6/H+Ogv/mOSNRus6A/nKFRjuxO7aU1nDC3bH
 jPGv4FloPqxNvpTe26mAtUy6lntXmuRLZSExYq8I3EsC9Y1xI/4EKQErEtevwv9l0J+B
 hccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682397819; x=1684989819;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q//kii23FKRzCG/0pybaXM8J980UgD3/Gh6plkgpeCk=;
 b=Uvsq541euh8UCLJf6At7TtAtLBSLzLRfaZLvVsexMJAeYSg6/Xy/xiGMSGKcXLASYD
 fRrGUWSLU21H53qjewDh5HQWk7gNagIzawAyvzuZBdKelJpshKEBSmwGHmusb9/Er4mO
 OFoppOeDrr0RcLp9maa8JdZrqvtFYiRDCuFToKnAigFLDxTKuSRdzRivJF4lzWiXG7HL
 GLD5K3Ogrfz7qLJeX1cM+Tkc73otcTiia3f6MlO6JfosyCV6NKfnkgXqsE+wklpwOvw8
 8IRm7kKhVqHo2hqmBir2i1GE5W2Atmm+Tl02FhYZl9CL25RTf399z//RKDaGW5hjjMA5
 6k4w==
X-Gm-Message-State: AAQBX9fyPlc7lbw9o6RHXp4Eoy/R9s9VAppqtX0mJjHyzsdy8V9BnToA
 C4BxlYR6EJ4x65r06F8LedZLYW7W+o2scRH1RXlsz8chde0=
X-Google-Smtp-Source: AKy350ZJbvuHMcQDpZ2nW7fH/ocULwdQC8nnXiYM7EpgvKC2ykoPOc2UHe8ypH+0wlp8PVWUAdQVbkFjyBe6XoT6YZE=
X-Received: by 2002:a2e:95c4:0:b0:2a8:a859:b5c7 with SMTP id
 y4-20020a2e95c4000000b002a8a859b5c7mr3046182ljh.0.1682397819114; Mon, 24 Apr
 2023 21:43:39 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 24 Apr 2023 23:43:27 -0500
Message-ID: <CAH2r5ms6tY9zqG+rm1Rk2NPCGKUC89FLgjgUtdTbo+NJkJUc-A@mail.gmail.com>
Subject: Samba POSIX Extensions automated testing
To: samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
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
Cc: "Volker.Lendecke@sernet.de" <Volker.Lendecke@sernet.de>,
 David Disseldorp <ddiss@samba.org>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

With the migration to the new 'buildbot' (smb3.1.1 client test
automation) progressing, I have added some functional tests to the
Samba (with POSIX extensions enabled) test target.  We should add more
 xfstests to this test group as Samba server continues to improve its
support for POSIX extensions.   Here is the first test run on the new
infrastructure (server is Samba master branch, client is Linux cifs.ko
running on the 6.3 kernel):

http://smb311-linux-testing.southcentralus.cloudapp.azure.com/#/builders/11/builds/4

Some things that could help:
- support for clone (reflink) to Samba running on XFS, not just BTRFS
(reflink is helpful for more than just cloning files, various tests
require it)
- support for mknod/mkfifo
- support for ACLs and mode bits on the same share

-- 
Thanks,

Steve

