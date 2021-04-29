Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 845FD36ECB1
	for <lists+samba-technical@lfdr.de>; Thu, 29 Apr 2021 16:49:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=ZmxUBvNnbykKXZEPNL9qjO4tMtEIJ/FaeYUPvslsi8I=; b=M+0NyKSxiIaHgtq8/8jwYNN6+2
	1QwP9gQd/QXGbFqSt0bu0tkzb7DX4cfC/1lY+YSW9ljtFDuamsgDc2FaAMAyvEyAkxMDJhdwjpnUx
	slIzb4tBmxaDvmrb/qtpDLSjsIj5zf4l+HsSq1Ai4u1DYxiMGoYZLN5vu9z2dERZ3PmGlhmDAF1YR
	aUtzCoxex/8UWlOzkH87R/R/2cL6fntLMhhWqlap0xi0lJAP18ucu59fSLK9hhcavD40ZPcJEHJq4
	//oR4PsAgrgd2hdXte0ip8n2u/uwijS66VUy0X80Yq9FW8APGjw8nro98OOjG3TmFacEGcAc+6M0I
	W9JE6zOA==;
Received: from ip6-localhost ([::1]:54356 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lc7yp-00DBgY-Hs; Thu, 29 Apr 2021 14:49:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49250) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lc7yj-00DBgR-1E
 for samba-technical@lists.samba.org; Thu, 29 Apr 2021 14:49:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=ZmxUBvNnbykKXZEPNL9qjO4tMtEIJ/FaeYUPvslsi8I=; b=Zho1eReK+i59qxATYfo6YH+nES
 T8+xwdiPeFIly8KieSGl02RUNCXlvPCDuga00GQ9AOY1PsnX6iz4nTWcevX8H/curAQh+v4nsWIvN
 BTeEGJOumGu6Pm8dk7fVKzGn1rEzeKqks+w6JKEFVxrqeDW5uJbHU67QQ4lqBm9oZONK/Ntdhh5bW
 pJW6gLRTyYenmZ0vBQbUzPUhZu37tU11ztig0vXIraXlrLBndAnxr0MdOGDOFXMIGsost2O4PGU5w
 S11HG1m4r8JQbeSxlqoM4ghwi+s71/bwMOEkbM+a5w8S+Sy8ZqCUU5ygiU6H0rXzsX4dZpC0lcWgy
 XXNcImYCvEBaeZ/QGRJIuTjO2z8l/jQxR/rpcttOQS4eiCjTm63aigtK5/3SasU4wf6TtPa0g/8W6
 Z+TR+cQvyXDzjgf0SdNdFXcHi2lA1mgLiZta6AhN3Ql22fdxsupIrn1t3QhJcCHtrkw4Ud+ZVGNrZ
 biLSf2riVN8eeaZDE5T89N/e;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lc7yi-0005mv-Gd
 for samba-technical@lists.samba.org; Thu, 29 Apr 2021 14:49:20 +0000
Subject: Re: Ubuntu's ADSys
References: <YIaZmO3WleOfenUn@pinega.vda.li>
 <vmime.608ab327.345.7841bc1123a20017@ms249-lin-003.rotterdam.bazuin.nl>
 <1d705810-cb2b-4012-6431-bf92cd5b213d@samba.org>
 <E85A0E756A8A4AB385CA655415709795@rotterdam.bazuin.nl>
To: samba-technical <samba-technical@lists.samba.org>
Message-ID: <ae50bf11-e09b-3f3d-9bab-319e3e5539db@samba.org>
Date: Thu, 29 Apr 2021 15:49:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <E85A0E756A8A4AB385CA655415709795@rotterdam.bazuin.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 29/04/2021 15:38, L. van Belle wrote:
> Ok, i'll look at it later on, for a desktop, which in general dont have
> samba its an option maybe.
> Even if we dont like SSSD.. ;-)

It is not that I do not like sssd, it is that:

A) It no longer works with Samba.

B) Even if it did, Samba does not produce it, so Samba cannot provide 
support for it.

It boils down to, do you want shares or do you want authentication, 
Samba can do both, but sssd can only do Authentication.

I am not against sssd, it has its place, but that isn't with Samba.

Rowland



