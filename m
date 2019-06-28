Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2A35A18D
	for <lists+samba-technical@lfdr.de>; Fri, 28 Jun 2019 18:57:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=xUJwlTr8PWwY2a4O3GtCdQ6KJQPyHRI1fGb7piV3HOc=; b=IaNA5Z0wnoDvJW320LmlEbZ9ez
	eVb+oU9RE7hnfImAWfUl5m5o6od0i+Kc6KewLeAvk2mE/wZr4xtupSx+IyXVuY/7aFgk/8FhRkGos
	Bda10uEQGl7hyQCr21Db2R03YKa2h8Bcq7EL+MkTvC4dDOpJ3Bx5NRI7P94h10pE8mloL12EG6rLt
	Nn2DwUW3xxUMBequPLHnWFdMJu3PB1EFtGtq/IhtyZho22rftSbsiJuU9Yc8ZZC+aGu2IIkHZTzIt
	e1gngEhD6iHA0v2TmNSWScZoB7zhVJBTbgfvItBGLNijqaLvC48A3Aa0bqvipqjtU+So2Rm6+IlQO
	6k5Lg+Cw==;
Received: from localhost ([::1]:65460 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hguAX-002Oa0-6W; Fri, 28 Jun 2019 16:56:13 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:37575) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hguAR-002OZt-K7
 for samba-technical@lists.samba.org; Fri, 28 Jun 2019 16:56:11 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 131so6664414ljf.4
 for <samba-technical@lists.samba.org>; Fri, 28 Jun 2019 09:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=r6cbHmTOMT1JZYprlLo3TDgKYTryDNd+Utpfzir9doU=;
 b=nAuBEHufbSLbiMeypb060po8aQZuKNhf9GbmwjYKJfSbxE8WMu3pdc+PIROBHU73gy
 xooK4f1eL6p5pOaG4NKnDxFUzlK75Jpxt5om+u1fOIDjUd6/BkWFMPRXq7+lqN51VP2Y
 LxD40MTxb/COpRtL9W4q7LQnc9eJzl1QRPSkemuzx3sm+XAnUk43w5Ud63R7an7EXK0b
 /LnDBm5j33DAUhoII+eQzL6YSPuwLcO2LGS026wGe3cXRMFi5TTmJMrFPukdzRRdLkgp
 gAsgMmqsWn7WFcZGC6nbQaNvrhzXHOYieaWgDniphwHsOvKwV24rHM4u1O+3WFOGbRXu
 8zjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=r6cbHmTOMT1JZYprlLo3TDgKYTryDNd+Utpfzir9doU=;
 b=ban1g5M38XSvmw5k+1ATk7jHeYr89AdVmBMTfxRSJBC25BuQVX7ABz7SinFluqwuJI
 wyfVfByuEzC2qIxX6DvHb4YW6c0ZIpudSK1FdXEtXakI3cNZIpDXGiMOZrOdU0BHEEh9
 L7YjDahPngPCt6ripsQ4UUpH/rHqmcImCExejWm8wiXGvg4FZHMRp1DqveerGugYS2Rc
 v28a2u5HhL5Y7dGDJvfeMnrLVl2sqiIiGM6poVeOGfXFs2J2RYD92oEEHDPPkfrZ2LEq
 tzCgu2Zwd6Dvp4OAfPp5IIsKIz70xLuuSTPsGRKnKQWRfKqtguPd1vwWg8S8y0p0/Qfa
 jGOg==
X-Gm-Message-State: APjAAAXBcnmmSGl/gjQbznSBtHYsiTRlgt4ZLa+vEoRZiqsk8cGsCT/b
 hqEUMhomR7nTO874F/6QVoPWD+2rcqA8VPQ/2leQ/r6G4Bw=
X-Google-Smtp-Source: APXvYqzON7ma5OW3sTrEum7q7LFR9aqMASEzXpAcsKJJspYUZnwb8yygOpCqkR12MZOXYxhQUEWd9PLp3iznaomIbrw=
X-Received: by 2002:a2e:9b84:: with SMTP id z4mr6923883lji.75.1561740966573;
 Fri, 28 Jun 2019 09:56:06 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 28 Jun 2019 17:55:38 +0100
Message-ID: <CAELK94eFMBfrvxoPQWC20TaUL3cGXm49cTsixkBS04hn6ckkAg@mail.gmail.com>
Subject: Clarification about Pdml output
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

Hello,
I am working on using the tshark XML output to do better and deeper diffs
(basically adding ways to let users add ignore rules). and I wonder if I
may delete some fields by default mainly :
pos - the starting offset within the packet data where this
protocol starts
size - the number of octets in the packet data that this protocol
covers.

-- 
https://github.com/RMPR
