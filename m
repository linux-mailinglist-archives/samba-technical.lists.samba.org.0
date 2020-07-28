Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDA9231583
	for <lists+samba-technical@lfdr.de>; Wed, 29 Jul 2020 00:24:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=5VO+4D+JDT2vizdR5i3OjJPCHhuQNGptrogGUndws94=; b=kN3QuyDnfhFhH/hE0ckKGPTPz4
	kMX8px6kSolgYug4/T6X+918H/TKNhtJu1/11h3Frzdb2dYpaQ+jla7jG+8BPb5Wj3NzMJAmp95YO
	aPv5JZXvr82oS9fuEQULXinJ/nak6Z724jMirgU9bFyRt3FElMN6N58aGR/NWB/xI9s9dyzmVBdQ6
	Vt3D1JpfJJZ2axQOB9oEEQcNGhGNdvgMbximpCiOg6Z/TUtQrQdQ76e3IIFxB7qV4ZYxgoQ0tSoQy
	FNjQGUdGFW9jChqfz2r0722WzwmBF0Mn+E94Hoz4IVSL9bn8avim2wVIlbit6EPxXbH8JqTcD+1I2
	1iWQjmIA==;
Received: from localhost ([::1]:22470 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k0Y11-00AAwh-Bc; Tue, 28 Jul 2020 22:24:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18398) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k0Y0v-00AAwa-UZ
 for samba-technical@lists.samba.org; Tue, 28 Jul 2020 22:24:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=5VO+4D+JDT2vizdR5i3OjJPCHhuQNGptrogGUndws94=; b=sZMLYeQY88JcB4BSO95g9ijwSB
 7K9phCwmeMhrr7meCeaMPDn8NDjFPENxtpglmUQ5iGJawQ/zMGC0RPE75PkQmtwv14oJr0p9h21Vw
 1bJR0wpCkmOJ8jq4A6pZ8lMN2HmJEi1toumIsHbzCbacAvRM09BeukTxCUCJpnW/hKXWVZNyKvSuP
 gHS8DcB+m5MawAr+GPGZlCNCydT2zQIdlKViRQBCn9gPbTz2jAfVLNGM6PMwkNy7Rzq+QV67AkF6w
 G3A3ZOEPLLtHN66L/G5q94ONMdrGZuBrfGTQRZhkq0FHUZvwSVL0/i3UcV0TRWq9fhC+Y9i7P9DfK
 geUcwibmVOdpPtUUE6OdRux8ZQAucHBJ/aKCBdVdx77/KYRRZVeEOxvv7/NpnQEKT28XSazueYkTX
 NJkB9v3DC3tzYudVyMAkhYfszv2/ZYGW5vvVOtH2Nt5XuVWVoF9P5wrr/NWzGfr7jmreZWOEbHg3S
 cULr8PCu19Pcx7DlOFhnHQT6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k0Y0v-00024H-0p; Tue, 28 Jul 2020 22:24:01 +0000
Date: Tue, 28 Jul 2020 15:23:58 -0700
To: Krishna Harathi <krishna.harathi@storagecraft.com>
Subject: Re: UNC vs Mapped Drive connection times
Message-ID: <20200728222358.GC3178@jeremy-acer>
References: <B08C375D-7730-453F-B11C-1357B78C0C10@storagecraft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <B08C375D-7730-453F-B11C-1357B78C0C10@storagecraft.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jul 28, 2020 at 10:21:12PM +0000, Krishna Harathi via samba-technical wrote:
> We are using Samba 4.7.11.
> 
> One of our customers is reporting that with Windows 7, 10 Explorer, connecting using Mapped Drive is taking 10 seconds are more compared to using a UNC path.
> 
> I am not an expert in this area, and I started investigating the difference between the two methods to identify and improve any bottlenecks especially in the filesystem underneath Samba.
> 
> Given the overwhelming number of variables/parameters in this context, I would very much appreciate this group’s collective expertise on pointing out any known issues to look out for.

DNS/naming resolution lookup times ? Are they connecting to
exactly the same name ?

