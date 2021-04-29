Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6C436EE37
	for <lists+samba-technical@lfdr.de>; Thu, 29 Apr 2021 18:33:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=BUlqGUbQQ8Rgbukrw7MJmIsv0Zkyf5WO/FdXO33TuZ4=; b=pdL9tboOTUN/C/EQNcnbhaXFk0
	/yv5V3eFxHsigNGMawDfwLwqEcYbObVRZQyigtEGkT6ATFxlNiAY+9zUM+lhEGutqnKmrQhIn5okz
	IjZM7XOmvvyjXW+j7WdZYagu7ySl0xGIkLzcRgWSxdSAdpNpVDu/SxxwvJNUJDsAR11D+1/F3nN7w
	SC9JUYuRXPy9YMd8KMCo2KzCO0DnHUgxGLSJb1RfPV6moBgSX/V5Cjb15Nv+XSEisg5heBcgDQCrH
	pte9bMbGdl1huCVnvOYeHVnXbOZCSog+IUOCFOep0twanWMm/gHjCXWkVkAO0jp0lxoYvNfF5LmTK
	74M6lMng==;
Received: from ip6-localhost ([::1]:19020 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lc9b5-00DDWd-LC; Thu, 29 Apr 2021 16:33:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27374) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lc9b0-00DDWW-O2
 for samba-technical@lists.samba.org; Thu, 29 Apr 2021 16:33:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=BUlqGUbQQ8Rgbukrw7MJmIsv0Zkyf5WO/FdXO33TuZ4=; b=XINFq8t1LuYbYpXZIItSiz4YA9
 87qgsWE8jeI7/v28REtOBuFHDbITvaiv79RtU510taDqX7Lw3IM081Cfbqkpd0zZIXphKDe9eykXA
 2IKTE5d2rcpy2rAKLlc8DeQN87v2paeyf2X0e++hpQjY88zr9Kjs7QOctYBjAEt9zn0QNumrJPaGr
 TEoGRoSvqBGYxt3ZiaVTC8mT6dDMJpJ+TlLMhuVAm18ThHWCY+OLz02D8bM3bLRnCR0g9NX4PL+6z
 awcBG9vdfuT4ztcIASYb6l6V/4NamKXiwYEIh9TKUoxULmnjfCiBnDT8OLyIkyVhjcpiNzD9a8ctJ
 pw6HPi7PJ/u4C6DtqNy56bx7DGuh4iN/WvS3FMTBR0yjqMaIp12UEGYu3yRUrxhsnNgpYasMZKF3j
 TOco4mlARldYFPiWSrH7CZeRPjdPL30q2N7MaogJ8A/Z1Dm5evnB6EQEhF2p587xaLlCXbrX8Bqug
 ZOO8ubaCFaPS8vA0MMVfgjeg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lc9b0-0006vw-HY
 for samba-technical@lists.samba.org; Thu, 29 Apr 2021 16:32:58 +0000
Subject: Re: Ubuntu's ADSys
References: <YIaZmO3WleOfenUn@pinega.vda.li>
 <vmime.608ab327.345.7841bc1123a20017@ms249-lin-003.rotterdam.bazuin.nl>
 <1d705810-cb2b-4012-6431-bf92cd5b213d@samba.org>
 <RCZBSQ.RP64LWX1DB4B@suse.com> <YIrXaNVMOKnOCt+3@pinega.vda.li>
To: samba-technical <samba-technical@lists.samba.org>
Message-ID: <aef2178b-28a4-baa0-1b54-8f4c7560fd4f@samba.org>
Date: Thu, 29 Apr 2021 17:32:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIrXaNVMOKnOCt+3@pinega.vda.li>
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

On 29/04/2021 16:57, Alexander Bokovoy wrote:
> On to, 29 huhti 2021, David Mulder via samba-technical wrote:
>>
>>> I was curious why something that had just been released with a big fan
>>> fair, didn't work, so I decided to find out why and, seemingly, I have.
>>> The problem, from a Samba point of view, is that it depends on sssd, so
>>> precludes the use of Samba. If 'adsys' can be forked to use Samba, then
>>> that might be an idea.
>>>
>> Samba already does group policy via samba-gpupdate, and it happens to work
>> with both winbind and sssd. ADsys says they provide "password policies and
>> user access control, and Desktop environment settings, such as login screen,
>> background and favourite apps". We already provide password policies, and
>> user access control is in master. Adding desktop environment will be trivial
>> (and much of this is already in the works). We're providing policies for
>> smb.conf, ssh settings, sudoers, scripts, and more. Seems to me we already
>> have more to offer than this ADsys thing does.
> Note that we also have FleetCommander tool[1][2] that allows to define
> desktop definitions for Linux clients enrolled into AD and FreeIPA.
> FleetCommander exists for quite some time, we presented it at FOSDEM and
> other conferences since 2018 or even before that.
>
> ALT Linux folks also have a comprehensive group policies parsing and
> applying tool[3] that relies on Samba Python bindings. The tool also
> exists for several years and will be present at upcoming SambaXP.
>
> [1] https://fleet-commander.org/
> [2] https://wiki.gnome.org/Projects/FleetCommander
> [3] https://github.com/altlinux/gpupdate/


It would be nice if someone could update the GUI's page on the Samba 
website, most of what is there now is extremely old and is some cases, 
no longer maintained.

Rowland



