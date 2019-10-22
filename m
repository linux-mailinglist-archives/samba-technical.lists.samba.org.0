Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 45695E01E8
	for <lists+samba-technical@lfdr.de>; Tue, 22 Oct 2019 12:18:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=hsuFLd9n5wQow17ZHZ9c5JqU227lX0KGgAth0fpmJow=; b=Ag6Q1V2ELZjrJXCz0XW6h8q4fk
	7Tz50WJAHwBxpjyxXCPSq2wWiar9XIVUMLe4Cx1QGXiR9ppRRywWJW/PpeN2Nl0ZUJquDpUsI3RcJ
	k+dkbYcUhSapF/aabQWzBd459pGff0Rq5nUa6KiirWknRI9KpO5Fh3dFN4al4KjKlNbgOUUGWT6Ng
	/bMGmlWW3Cyjv4e0ZJXUmQ7Xh6o5h9gU1MkyJaIE+XPoqLjf1Sp/DfQoQcWjjrz4nv4xKxJMlmkRe
	GkfsEKoXGMbFkV1Jtuts/ioVPdEx7e4M5+yhYdJm+O5aylTFIXaB8gMEpQCBp8aEgkN9W1HyMxioG
	Er7f4wNQ==;
Received: from localhost ([::1]:45914 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iMrEo-001LxR-0I; Tue, 22 Oct 2019 10:18:02 +0000
Received: from [80.20.169.36] (port=34854 helo=mail.promoturviaggi.com) 
 by hr1.samba.org with smtp (Exim) id 1iMrEi-001LxK-VX
 for samba-technical@lists.samba.org; Tue, 22 Oct 2019 10:17:59 +0000
Received: (qmail 17549 invoked by uid 121); 22 Oct 2019 12:17:43 +0200
Received: from 172.16.1.1 (dario.lesca@solinos.it@172.16.1.1) by
 albatros.promoturviaggi.com (envelope-from <d.lesca@solinos.it>,
 uid 89) with qmail-scanner-2.08 
 (clamdscan: 0.98.6/25609. spamassassin: 3.3.1.  
 Clear:RC:0(172.16.1.1):SA:0(-102.5/5.0):. 
 Processed in 0.173133 secs); 22 Oct 2019 10:17:43 -0000
Received: from unknown (HELO dodo.home.solinos.it)
 (dario.lesca@solinos.it@172.16.1.1)
 by mail.promoturviaggi.com with SMTP; 22 Oct 2019 12:17:43 +0200
Message-ID: <ae8f0a7928a7015d7abfa9679de2f5f4d23b4eed.camel@solinos.it>
Subject: Re: [Release Planning 4.11] Samba 4.11.2
To: samba-technical@lists.samba.org
Date: Tue, 22 Oct 2019 12:17:41 +0200
In-Reply-To: <CAOCN9rw1g-N8iAV2z4S=-6Sx7GRQ_vACPcy-pOvwrLys_OykVg@mail.gmail.com>
References: <3ee51a4a-c102-df01-8e52-cf8ea702194f@samba.org>
 <CAOCN9rw1g-N8iAV2z4S=-6Sx7GRQ_vACPcy-pOvwrLys_OykVg@mail.gmail.com>
Organization: Solinos
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
From: Dario Lesca via samba-technical <samba-technical@lists.samba.org>
Reply-To: Dario Lesca <d.lesca@solinos.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Il giorno sab, 19/10/2019 alle 12.22 -0400, Nico Kadel-Garcia via
samba-technical ha scritto:
> Cool! I just managed to get 4.11.1 into my published CentOS 7, 8,
> andFedora setup at https://github.com/nkadel/samba4repo. This setup
> usesHeimdal Kerberos, which eased the gnutls requirements and made
> CentOS7 easier.

Thanks Nico
How can use your great work?
I must rebuild all on my system (Centos8) or I can use a binary repo?

Thank
 
-- 
Dario Lesca
(inviato dal mio Linux Fedora 30 Workstation)
