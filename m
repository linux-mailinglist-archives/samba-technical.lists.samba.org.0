Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 076D5CE709
	for <lists+samba-technical@lfdr.de>; Mon,  7 Oct 2019 17:15:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Qh/vJgAQKnDyNpK689du+PXB48W17U2QA4kodNeX+ew=; b=t0/22kD62aRM7QRYFkZa5RYhNq
	nr4/lz8inPbfi7HcoVohEs27RKa5KUUR/RUWje09+S+4RBy7oSrVb4ts5KPWnvSGNXEXhfm+YFE9r
	sLkxeUJaYbI2f11vZpeQEFAdR5ctDPhSmLVKDBhdYxT4XtSnEaOT2osm2LdsDdHBarAMeCwv18C5n
	TqBsXYQODPSXYWeYmAv/P4yNL+VCXsSMtVFZaKnsBXaRD5KrgtBLgKTQZC5ETXDNdqiTOizEVO60/
	AvHKeTo8DzHjpYYfsvQR8DJBxv+FVN1mWddIVPUXXYrll5CfBkd3HJegRF6mLtjI5jJfDdX+YYzPA
	ICGVfWMA==;
Received: from localhost ([::1]:54684 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iHUis-001rCW-K3; Mon, 07 Oct 2019 15:14:54 +0000
Received: from [80.20.169.36] (port=59456 helo=mail.promoturviaggi.com) 
 by hr1.samba.org with smtp (Exim) id 1iHUio-001rCN-3L
 for samba-technical@lists.samba.org; Mon, 07 Oct 2019 15:14:51 +0000
Received: (qmail 21491 invoked by uid 121); 7 Oct 2019 17:14:47 +0200
Received: from 172.16.1.1 (dario.lesca@solinos.it@172.16.1.1) by
 albatros.promoturviaggi.com (envelope-from <d.lesca@solinos.it>,
 uid 89) with qmail-scanner-2.08 
 (clamdscan: 0.98.6/25594. spamassassin: 3.3.1.  
 Clear:RC:0(172.16.1.1):SA:0(-102.5/5.0):. 
 Processed in 0.150822 secs); 07 Oct 2019 15:14:47 -0000
Received: from unknown (HELO dodo.home.solinos.it)
 (dario.lesca@solinos.it@172.16.1.1)
 by mail.promoturviaggi.com with SMTP; 7 Oct 2019 17:14:47 +0200
Message-ID: <af664c35ec71304dfc64639b82054614373b762e.camel@solinos.it>
Subject: Re: samba 4.11 rpmbuild on CentOS7
To: samba-technical@lists.samba.org
Date: Mon, 07 Oct 2019 17:14:42 +0200
In-Reply-To: <20191007132204.GL5765@onega.vda.li>
References: <dcc2c49e-08cd-e077-6506-53020b3ffc58@tranquil.it>
 <d6e33d3f085cd509f2915cc0e50f50572416e169.camel@solinos.it>
 <0091979d-7696-5502-d34d-acd2725bfd36@tranquil.it>
 <5800371.XWyRSs5115@magrathea>
 <ca548b9f-4664-1503-b6ec-f4b04e6e5267@tranquil.it>
 <20191007132204.GL5765@onega.vda.li>
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

Il giorno lun, 07/10/2019 alle 16.22 +0300, Alexander Bokovoy via
samba-technical ha scritto:
> We worked with Andreas this morning to add CentOS 8 support to Samba
> CIsystems.

Since the .spec file is the same for centos/redhat/fedosa, I suggest to
include in the .spec file a flag like this:
%global with_mit_krb5    1 (or 0 for heimdal)
in this way people can recompile samba with  Heimdal Kerberos instead
of MIT without modify .spec file
Thanks

-- 
Dario Lesca
(inviato dal mio Linux Fedora 30 Workstation)
