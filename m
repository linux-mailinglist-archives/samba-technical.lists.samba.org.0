Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C233FC217
	for <lists+samba-technical@lfdr.de>; Tue, 31 Aug 2021 07:21:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=B9eviigynY6xuWjz2n0z4Wkqicoc2rDs3dqf/4N0wuc=; b=1ciPr7qsgR0svbyo/zcFm5Qboq
	84HflpmofojZddcjVsuXTjPotuDUW1ZMSQT+XblpTC2yNQGYGrN4FEMKl9udS27z4zi64pi+QtWbE
	xk7kdmCCVdBFiOhjMvCuQNtFKoBXpiilQxuMHGbhz2aLTd8QfznlCw0B2RJ5OUToG0GFsL7UJ0tIZ
	WAW0xf4xpDQREIu0B4g2rlDLwCG8L8qnZ9ud4uO6oRGsn1+atGGV2Oud8PuhTpg+yXBVvGBXuBFF+
	fohB73tKKlSFGlGnEqDNlFOzx3wwvhYNcuE4m/zXPsle6KAlPGhTEVNymfO2bcavA4J+nKRK/De+0
	eArDLY4g==;
Received: from ip6-localhost ([::1]:18594 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mKwCy-00A5Bb-2X; Tue, 31 Aug 2021 05:21:16 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:37866) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mKwCr-00A5BS-Lj
 for samba-technical@lists.samba.org; Tue, 31 Aug 2021 05:21:12 +0000
Received: by mail-qt1-x82d.google.com with SMTP id l24so13694648qtj.4
 for <samba-technical@lists.samba.org>; Mon, 30 Aug 2021 22:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mattgrant-net-nz.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=HUHYuTgAxswazD/svOiZVNxd2Y7yTw+At6r0GFQzWZc=;
 b=EQlzoB+Y85E+dNbyZnkSF950FPtwHebNiBRcwxBIW0MabUWLS1f5hGwYozCysF7ROJ
 Z5x6dEMa4TyhLihORrR4Gf+4ZWNT8lVK6aWJ03/yR80xcOHVeB51uQxMeZNxGxGFgk9M
 1rwoaUogx59jHt9xOvsR23VX2fmgKAMg2wx06hay7uc1OLh6k1xVYNyfP3Tngb/jElKn
 J+jVcO6ocCi7ZdZjO1PL+Y8ZTfWjb8P2nx07MuzJak8shZtgfQI4D5XDMBE9iW8BWu4j
 8pliwR1jF/Iw1dF6lZIMo9xmlBBwiwSk2EAGB/PrknObyPPYvqbX/4UvrebRse9yl1oy
 GZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=HUHYuTgAxswazD/svOiZVNxd2Y7yTw+At6r0GFQzWZc=;
 b=q4Sgf2qrX0pG2reC/iviNBHDdIRge/Gp2ez7072A/aWuSU5DzqzWyUPVlMIhg+vX+a
 mqjHL3pZH8pMjbeHHMt+ul83lHlqMJ+HBmQSeHO2Tnx5OOVTjUq1TM8pVD6lrhKGeKr0
 4Qu721zg/4tTd8SXaRn3bAxqkXX8V0iudqBiZP1gc72B2AVjNRWQt+xuTOp27VRXJMkv
 4u9Lj5MBigTekQwlUrQFKIrqtSmgAp3Cw49wLbgehwuhEc4f08PY9IfeGdLvnQoY4q6M
 t2JL8NlSHaD3WPOiD12BIO0kY1qih1HWU7JNQj6KFJapZwQhPPxI6zjngnXo0m7vdAnL
 Wruw==
X-Gm-Message-State: AOAM5333QJ7omOKXInmJMD5SU5Gq8F4a6JIyV9AS1QWa5cpgkbcAsn2o
 dzIzUFVy3UayoOou/kIHv07768WJwY14lUvmVr2u3GARzmlMbQ==
X-Google-Smtp-Source: ABdhPJwH9F23z99WzlRvqGIXGEMHtzOZnoL/WtWWqywEkoJIPQlT7wHTS6HPggwoJOJBrDQAFIMtL2lhLjOAQAlEwkU=
X-Received: by 2002:ac8:7b5b:: with SMTP id m27mr1147824qtu.316.1630387267018; 
 Mon, 30 Aug 2021 22:21:07 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 31 Aug 2021 17:20:57 +1200
Message-ID: <CAHA-KoObp6CvJg05wbSypST_4eAtGhuTg9eUkcBYw+PTV612og@mail.gmail.com>
Subject: Help writing new SAMBA_INTERNAL DNS test code please.
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
From: Matt Grant via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matt Grant <matt@mattgrant.net.nz>
Cc: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andrew!

Have not created Samba bugs for the following yet, as I am trying to get
the hardest part doen, writing the test code.

   1. Dns server port number specification for smb.conf 'dns forwarder'
   server list
   2. Restricting the dynamic DNS update ranges so that the SAMBA_INTERNAL
   server is not spammed with IPv6 PD addresses from the ISP.

Main issue is being able to dynamically change the smb.conf setup for the
Python self test hookup, for 1, specifically within
samba.tests.dns_forwarder.  Being able to do this will also make 2 far
easier.  After looking at the test code set up, I can't see how to
dynamically change the smb.conf file in st/samba/smb.conf while the tests
are running to set up for testing the port numbers or not.

Would specifying a 3rd and 4th 'dns forwarder' entry be possible?  I just
don't want to up set the already written tests.

Best Regards,

Matt Grant
