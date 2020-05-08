Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBD31CA1D0
	for <lists+samba-technical@lfdr.de>; Fri,  8 May 2020 06:12:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=iETf85D9hZ+WBtq6yeEUcSn4Cz3Qjb4KDClZaSAZKJU=; b=zpMrR/JXWKg5A+NQdB6OTCxCzB
	iVPxfyQIuw0t0k8/d2sq2iwfIsq1qdysfEn9QcnYq9e1GFjS9HlZuWpdwxWUhlq9+BOLPIWswRZSk
	OUzloC+fa50DcYFi1NCZ1FZ6jI1PJTpdJEtlTGcT45tQNCgknjSF41UdY+zQSCs2qMXcj3Sezlx0F
	Lez8lusF2HgiC3I259R4rR5jfzS69wlgUbygJ28Uja/y4zyyHc3DRZVKZto6n3VQWiJyRynBOS7AN
	lE+HEwwDZG+EzqGuyC6ZZyz6nuKS1XhyXLW4SFOfUkRcWLtSm0YDZG5IeGQ4t+QrazeuFfQt0KxDE
	1Qu2uB2g==;
Received: from localhost ([::1]:54638 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWuNM-003Cq2-Ed; Fri, 08 May 2020 04:12:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10140) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWuNG-003Cpv-3G
 for samba-technical@lists.samba.org; Fri, 08 May 2020 04:12:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=iETf85D9hZ+WBtq6yeEUcSn4Cz3Qjb4KDClZaSAZKJU=; b=v52H8VqJVNWGzVpluJ4/s8RlV0
 NIEDvXWX8E9iIDWLFAARGyu+WfN7812Wd7Jm2aTcELV87Sb2zo2trrnypxSXIrbZ7nP1sHomZDAP1
 gvvpxLthBrOM4cJifx6CINR+OXEhBsjqooznn+HHs/Lc/DtMPurMiEoBdfNSyGCL1fGOQjs8AsZBW
 B6HjG/7R4FDYuwrxdW52z8dy9RatiE/mImZR+XNyh08GY/cXkwemWRusZaO97FRBkrA773uIqivZk
 jW9XmUmckltcoJ/FqlbB1DnuvHV2PiLp7D6cVANl9nIkkj4sEEikOkY14mJaNAYbdq5NSIwSInjU2
 bPK1Uj/zFxz0vVQiclLxoD/Zx5t8SK/ayce112fbc5/rm2XJWI4qLTgedWKBnm03goPa9C9lWIJU4
 Ok+r4IXEUmOfGVQO82VP1w/JXNMAge/Y7c2tzy/bfNgMdoJbNYM8/BEmw3WwYCqmCQehT63a889DU
 VlxkfziLQHU1Sf4th3sFv76y;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWuNF-0007f5-5D; Fri, 08 May 2020 04:12:33 +0000
Date: Thu, 7 May 2020 21:12:27 -0700
To: Ashok Ramakrishnan <aramakrishnan@nasuni.com>
Subject: Re: [EXTERNAL] Re: Windows 10 client opens a folder as a file and
 asks for SMB2 GetInfo SMB2_FILE_STREAM_INFO
Message-ID: <20200508041227.GA25575@jeremy-acer>
References: <BN7PR07MB44024AA885AAD1881F852A40CFAB0@BN7PR07MB4402.namprd07.prod.outlook.com>
 <20200501175828.GC29166@jeremy-acer>
 <20200501180218.GD29166@jeremy-acer>
 <BN7PR07MB44024B8600FDF859C55E405FCFAB0@BN7PR07MB4402.namprd07.prod.outlook.com>
 <20200501190057.GF29166@jeremy-acer>
 <BN7PR07MB4402F1447DB39F38F1953B30CFA50@BN7PR07MB4402.namprd07.prod.outlook.com>
 <CAN05THRX3Zg04x2AHhxAFD6zBf1AbFvVSVjLnxHRXfudoCU-PA@mail.gmail.com>
 <BN7PR07MB4402B9B805289F60A20B28BDCFA50@BN7PR07MB4402.namprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN7PR07MB4402B9B805289F60A20B28BDCFA50@BN7PR07MB4402.namprd07.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, May 07, 2020 at 09:56:41PM +0000, Ashok Ramakrishnan wrote:
> Yes! I haven't figured out the exact algorithm for which component it drops... It usually is the last directory/folder in the path, but I have seen instances of it dropping more than one component. So, though I cannot claim it is random... I have not been able to figure out a repeatable pattern of what gets dropped.
> 
> Client here is Windows 10, file explorer, right click -> properties.
> 
> Not sure how other users of the windows file API behave...

Thanks so much for the explaination Ashok,

That's certainly one to remember for future
issues.

Cheers,

Jeremy.

