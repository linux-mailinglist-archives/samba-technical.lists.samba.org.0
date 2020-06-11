Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2BB1F62B8
	for <lists+samba-technical@lfdr.de>; Thu, 11 Jun 2020 09:38:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=nVphka4i76MliRgC+taxvY+tViGFS6o8o+8Ln2xOfMA=; b=YllIHUwsTVcyXXThWt1cSC3xiC
	sEtJ9dOzToaOypCddgaDZZGxEV31LMgyu5oIZFaq9p2qr2AXmZDSnnvQr7kW5P3I+7CJT7l/MNtfj
	kc5xXpuX0QesE/GdEsyZyGqIXsa6kovQfBw60cvP3N3dMnuImRv+P8eo4/R8Xc4u0cANHjhHFSgLh
	wn09xxL0o6+9jFRoOVLFb+vY5bKcUPcYukPxdTECMwvWlivp4UvRoEU/cxl622G9j/snNQHN1akYo
	iU0IifO6YPak3ivwdFfeTxBji9J4+9kLSTikWR6PIeARDDc0OKOMrCaoxIX1Bc17CeYfEgpX8gzjN
	jbQJ9sZg==;
Received: from localhost ([::1]:31112 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jjHlj-0001pK-LF; Thu, 11 Jun 2020 07:36:59 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:39049) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jjHlY-0001pC-M5
 for samba-technical@lists.samba.org; Thu, 11 Jun 2020 07:36:52 +0000
Received: by mail-ed1-x531.google.com with SMTP id g1so3215357edv.6
 for <samba-technical@lists.samba.org>; Thu, 11 Jun 2020 00:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=mFCPuUOog6sMDzHYZ6s85EUS8tJePLCFS4kNySRVVH4=;
 b=qNS1M7tnPNbca7RJrEo2eJvDLR2FhFb1W60azQl8tdFE9MQ5LjVCIv3a2yccvwerxE
 91iGuRRKQgdPFIetUNEgHiaKtXOReg8DCARaDXIyUYbcWiZ6Xo9fOu2ZPFJYFfb2SmGc
 rsR0wa7P/6wEQvQHMEiZhzOBEK0EJ409WI8LAE19e76LmhXiqDMk34VcJyNEqmNZJTXI
 eeKThNlV7AZ78f5+/FJmnzHP/x5YN0MvnoQb0zJtOqEyTmXYbwRKjegLiMXnRKsgU17B
 NL2kNtp6bFubMglKRYueX7TJG5sAEPn81j6alGLfTBNvoaaaEugQhCTf896PpiObZJ9y
 FgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mFCPuUOog6sMDzHYZ6s85EUS8tJePLCFS4kNySRVVH4=;
 b=gACNuSve5ROMq95LNx1vOmFmW14AxjdG/1rCJg9GkA4f0tgXCxoMFF7V8YxHWPp/4K
 xjELmCCSa2nHWhqwj2hrJaiXF/C2IO/IrPVNVEJFwZ6lrA0xXp9QC273OqLPeS0P/sl8
 wGS/irSV3Q8GKQb6wSEEAacqUf28ipkJ28UH5ZpESBmvzbqjTTzfR0WA4DULv/gh7gdf
 H0cT8t0cYahblcAxCaRUyf1a7vnDlQXykgIPq5ZK3FRXqcALWaPW6azlO8+hJ/h6h9SM
 exEamdsHCYGMMUoE25eUfRThzB4tq65K6a9w8PFz7fqI/oDBHbajzlnYn3d+6YdZKpL5
 +KAA==
X-Gm-Message-State: AOAM531FTC4o9zD+CnQokc34gl4Q9glWGVbg5MxlYd+C+EFgGrq24ogG
 ezHskLVwZLLdTVh94bGzxZHOOnXT+qnqiLol5rzZTn9Z
X-Google-Smtp-Source: ABdhPJwHWI+NwGtE+P5OuHyvRqLLUQrwGIY6yM/LgEX6Hjug4r4IfW5odaICjKn0CzlDT8p6bsQxx7ucElfauev0XG0=
X-Received: by 2002:a05:6402:1216:: with SMTP id
 c22mr6020709edw.208.1591861007750; 
 Thu, 11 Jun 2020 00:36:47 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 11 Jun 2020 10:31:39 +0300
Message-ID: <CAH72RCVhmE3Gn1uiC2iRV2_-EbC7bWW_WJeX+n8xs42me6bgVQ@mail.gmail.com>
Subject: GSoC 2020: Week 1 and Week 2 Progress
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
From: hezekiah maina via samba-technical <samba-technical@lists.samba.org>
Reply-To: hezekiah maina <hezekiahmaina3@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Members,

I wanted to give you an update on my progress for the work I'm doing during
the GSoC 2020.
Week 1:
 I worked on some bits of the following:
  Computer Management - List, Create, Delete and Showing the AD Object
  Time - Showing the current time on the Server
   Domain Management - Provisioning and Domain Information.
   Sites Management - Creating and Deleting
   Contact Management - List, Create, Show and Delete Contact
Week 2:
 I have been working on the following:
 User Management - Creating and Listing Users
I will continue working on the same and hopefully write tests for the app
before the end of the week.
