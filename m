Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 419872F6100
	for <lists+samba-technical@lfdr.de>; Thu, 14 Jan 2021 13:22:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=5t4VOkLsFY0YDlEZOvBD9TjVMUz7lExF3yWgqeBceB4=; b=vnKIai2gNYDnibhWKiWhjHwoN9
	UJb/cgQ3AsmCuCZ8xdzis9j2kZSduxeKqs1jWsnUWCmU9hocb19Gb1kYjcVxsyVR4h3Yqy9FUhP7C
	HHtJzQuBwy0Y5R26TpRQDudHFejzCLC1GsHcX1XHzENygwOTZqipN4NlXGlAY+eepLLicW4GrFc0B
	HVzDjYabAbja2XyjSesO11dYXqN0PT78dJLnUBAPEtY1DZd+wjCNA4ZHTuC6KSA6IlVXsNnKfLYDs
	Ibk5ptAok3SuMsvQaQC9Why61DOdzkbrrWiI4SB1vcQHB9Zzs+k+zu1hkCM+K6J4pvdx5R3z0msmX
	DpOLBUpw==;
Received: from ip6-localhost ([::1]:26444 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l01dF-005ggR-Rg; Thu, 14 Jan 2021 12:21:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61434) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l01dA-005ggK-Ak
 for samba-technical@lists.samba.org; Thu, 14 Jan 2021 12:21:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=5t4VOkLsFY0YDlEZOvBD9TjVMUz7lExF3yWgqeBceB4=; b=DheWkEVd9IJAgLh/AFj15ywnSJ
 7DWMWU5pknnosDhn2zG1g1mspHAi9gDVUODSqWGiBjwXr6UO5ValiwerSA/b+QoAMok8RkRLqAJgN
 1QLstJy0zDiLZCmufL3E84RK0UC6LrCYw654EiHbkqdmTj1CxduVPKkLqzS2NjKZWAYFfCs/rqzHO
 jY5zHiLehD/OIhXxPYUb0UezykkA/5R/7PidFN4FdOfpBttYAAxlBau4mw47HTF0sK99p27ilVDsz
 awLRGf0RTmXbhZyU5f6t2E/Bh6JrmnGchlYjNenCBNpOCa19E9i055lHBjXIzNf3NWSEG7TnbXSlC
 3n/21J0wtrDoAQYuJlUv5Cdw5SNYGTysOiGydtb18DlGyvUChJO5bXgLWKCakfX+jdCP+Qmn8XRXh
 0KLQL7P1HhS9j8686NJ9W/iNiGkms5nAMQdg1yQSrrKp5w29vTxbSl59Ck38JyIHAr/Lv5E75BcV4
 1S/N7lmZKHJ1U6hsBXR5nWnf;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l01d8-0007kh-VB; Thu, 14 Jan 2021 12:21:35 +0000
To: Alexander Bokovoy <ab@samba.org>
Subject: Re: DCOM WMI
Date: Thu, 14 Jan 2021 13:21:34 +0100
Message-ID: <8105884.gFQYUfJxVU@magrathea>
In-Reply-To: <20210114110137.GQ5029@pinega.vda.li>
References: <2384324.bt8ldtCKjX@magrathea>
 <20210114110137.GQ5029@pinega.vda.li>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, 14 January 2021 12:01:37 CET Alexander Bokovoy wrote:
> On to, 14 tammi 2021, Andreas Schneider via samba-technical wrote:
> > Hi,
> > 
> > I've just recognized that source4/lib/wmi/ has a wscript file, but it
> > isn't
> > included anywhere. This means the code isn't used nor built.
> > 
> > What should we do with this code? Can we remove it?
> 
> Cannot answer this but I may have a need for DCOM which is also used by
> WMI and only referenced by WMI IDL file.
> 
> We have a customer request to support MS-ICPR which is a limited version
> of WCCE protocol (only a singe call is available in MS-ICPR) that
> depends on DCOM. It would be good to keep DCOM support. MS-ICPR is also
> used by macOS[1] to be able to request certificates off MS CA.

So you need the IDL and not the tools which are not built at all ...

You can always revert the patch removing them when needed ...


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



