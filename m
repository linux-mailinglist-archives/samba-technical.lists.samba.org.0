Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F31781867B8
	for <lists+samba-technical@lfdr.de>; Mon, 16 Mar 2020 10:20:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=MS6ra06hQP5jy3yprrY9FXnzu5y+NFV6Q8uZFSdYAGY=; b=FasCo2VaznQeRHsM+hGMt3J9Ed
	ty0R6f+SoLRMPE7/7PgIuvTXXgVEMvVrrjNvMhif63CyhdwWUGl8N5tcMdML01sP21N/CqD/VSDQO
	T8mmZQDbHi+mxdJETPiUlXYjl5GS69EP2mQlgt7lOzYi6F2psK3UFUh8GzE/P6YXa3HA3gP/1Ffoc
	xZmSFAA/5tlFcHvPDobzc8SjynKodJTOwUEZZgTEzUBukPStsz3hBN3xu+OGDMjoIkaRTFJP+kt2h
	FvbCj5tZ9jB7WdoYEHAN83fr/vMUljmsqPlT9lTOvq7b9t9gv2nnNkftrByK3/s9dqxtDIVJHx7BI
	1b0QEDcw==;
Received: from localhost ([::1]:49796 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jDluq-0004zK-Oz; Mon, 16 Mar 2020 09:20:08 +0000
Received: from [80.20.169.36] (port=41343 helo=mail.promoturviaggi.com) 
 by hr1.samba.org with smtp (Exim) id 1jDlum-0004zD-5E
 for samba-technical@lists.samba.org; Mon, 16 Mar 2020 09:20:06 +0000
Received: (qmail 6446 invoked by uid 121); 16 Mar 2020 10:20:01 +0100
Received: from 172.16.1.1 (dario.lesca@solinos.it@172.16.1.1) by
 albatros.promoturviaggi.com (envelope-from <d.lesca@solinos.it>,
 uid 89) with qmail-scanner-2.08 
 (clamdscan: 0.98.6/25752. spamassassin: 3.3.1.  
 Clear:RC:0(172.16.1.1):SA:0(-102.5/5.0):. 
 Processed in 0.251281 secs); 16 Mar 2020 09:20:01 -0000
Received: from unknown (HELO dodo.home.solinos.it)
 (dario.lesca@solinos.it@172.16.1.1)
 by mail.promoturviaggi.com with SMTP; 16 Mar 2020 10:20:00 +0100
Message-ID: <35cc3bc0726ca04c7613a6aa03cee7dd48776eb7.camel@solinos.it>
Subject: Re: Samba 4.12 rc3: bind DNS say "named: client update denied"
To: samba-technical@lists.samba.org
Date: Mon, 16 Mar 2020 10:19:59 +0100
In-Reply-To: <20200315064050.GR2735275@onega.vda.li>
References: <a144cd2c0219399cea4473f6cf7e86b3dba5d6cf.camel@solinos.it>
 <20200309100715.GK2735275@onega.vda.li>
 <dad25a37497ed4d4b70829925da512b3abb4eb39.camel@solinos.it>
 <52a0f365-579c-5adc-a470-7cf543a0c868@samba.org>
 <2ee4998776b6d690b9f458cdfca7c11626e86784.camel@solinos.it>
 <1e12e848-3540-7651-8712-752600680296@samba.org>
 <20200315064050.GR2735275@onega.vda.li>
Organization: Solinos
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Il giorno dom, 15/03/2020 alle 08.40 +0200, Alexander Bokovoy via
samba-technical ha scritto:
> Authorization doesn't work because bind_dlz doesn't provide any
> and there is no way to set it up otherwise.

I have fill a bug on bugzilla.samba.org.
https://bugzilla.samba.org/show_bug.cgi?id=14321
Thanks

-- 
Dario Lesca
(inviato dal mio Linux Fedora 31 Workstation)


