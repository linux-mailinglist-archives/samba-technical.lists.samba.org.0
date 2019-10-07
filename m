Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D01CDDE8
	for <lists+samba-technical@lfdr.de>; Mon,  7 Oct 2019 11:04:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=nMV7PiCEomxODpC5KXsnIAXkPrL2G7ucTvzuVOMc6oQ=; b=iFrpLbfls6bIU+aHHbRTJvJBNV
	ueIe42OW2t6Ay6t+8ZJ8tBX++cCyNy5K39vkp/xQDPEKK1pafwIDE3g/v97XWoMwdk+hxZTjoK5EH
	7DCdaCCvIDy7MLABboR92YfHNq98mWPs3HROB+mkSEUKgiHYaBITh3uCM4QVdRLQZjRp4j+KEcGle
	+tQlOZ4oM4COk0oglEwmaWzlX152DPmY+5CehzSVQgOddwROgumb/QvhX4wrYKFbEysp23qqSZTev
	zPPs6FXmyurfNIfnLwMX+V5wG54kzRN7Y2ftRwRVcjGmgeILPAYM5gmYGloL5+KbAniJKxB7UUSWN
	C3hNzQxg==;
Received: from localhost ([::1]:38852 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iHOvp-001mGz-AK; Mon, 07 Oct 2019 09:03:53 +0000
Received: from [80.20.169.36] (port=49142 helo=mail.promoturviaggi.com) 
 by hr1.samba.org with smtp (Exim) id 1iHOvl-001mGs-VV
 for samba-technical@lists.samba.org; Mon, 07 Oct 2019 09:03:52 +0000
Received: (qmail 18519 invoked by uid 121); 7 Oct 2019 11:03:46 +0200
Received: from 172.16.1.1 (dario.lesca@solinos.it@172.16.1.1) by
 albatros.promoturviaggi.com (envelope-from <d.lesca@solinos.it>,
 uid 89) with qmail-scanner-2.08 
 (clamdscan: 0.98.6/25594. spamassassin: 3.3.1.  
 Clear:RC:0(172.16.1.1):SA:0(-102.5/5.0):. 
 Processed in 0.143275 secs); 07 Oct 2019 09:03:46 -0000
Received: from unknown (HELO dodo.home.solinos.it)
 (dario.lesca@solinos.it@172.16.1.1)
 by mail.promoturviaggi.com with SMTP; 7 Oct 2019 11:03:45 +0200
Message-ID: <d6e33d3f085cd509f2915cc0e50f50572416e169.camel@solinos.it>
Subject: Re: samba 4.11 rpmbuild on CentOS7
To: samba-technical@lists.samba.org
Date: Mon, 07 Oct 2019 11:03:44 +0200
In-Reply-To: <dcc2c49e-08cd-e077-6506-53020b3ffc58@tranquil.it>
References: <dcc2c49e-08cd-e077-6506-53020b3ffc58@tranquil.it>
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

Il giorno dom, 06/10/2019 alle 23.59 +0200, Denis Cardon via samba-
technical ha scritto:
> I have given a look tonight at building rpm of Samba 4.11 for
> CentOS7[1].

Have you build it with MIT or Heimdal Kerberos?

If you have build with MIT there is (yet) this problem
https://bugzilla.redhat.com/show_bug.cgi?id=1748860
-- 
Dario Lesca
(inviato dal mio Linux Fedora 30 Workstation)
