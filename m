Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C73C036F794
	for <lists+samba-technical@lfdr.de>; Fri, 30 Apr 2021 11:09:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=fTFwr6zpfhbdENQ/NPb7h9x7AifOEeuAfhBeKMuITGM=; b=D5z8Ns0baQfXa+Eo5ZD+gJO8kv
	IKFFCrdxVHZs0y7VPgKz4H+IfcVXOWBOFh+gPgM+IMHP5UCrcUd/cm0h3KLvc5uyQMDZBgd35e3WR
	z7pdQY4NKZy2QeZV80ty+ZqsOGldrAmgv8KqFe9qU2dxRwriS42/jf4ozYIti5lhS4h9/Qi6mcDmR
	vEuPv2TJzht2N60MBeqvJS2GHFLayUt5lQapkwhhe4Kqb7zDvnrxId2nn9Usc0Gh6BOyc8KKA20cL
	Y3SOPaSX54mb/4/9Xe2Sa1f4I6fTo7ueGTGbupfHo4YB2ar5rvOKllzDX4RXIfYEuNmHFm1tZkRNE
	3CP+jPjg==;
Received: from ip6-localhost ([::1]:40536 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lcP83-00DI6A-N6; Fri, 30 Apr 2021 09:08:07 +0000
Received: from air.basealt.ru ([194.107.17.39]:48038) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lcP7x-00DI63-TQ
 for samba-technical@lists.samba.org; Fri, 30 Apr 2021 09:08:04 +0000
Received: by air.basealt.ru (Postfix, from userid 490)
 id 1A230589420; Fri, 30 Apr 2021 09:07:58 +0000 (UTC)
Received: from [10.64.129.4] (unknown [193.43.9.4])
 by air.basealt.ru (Postfix) with ESMTPSA id E105658951E
 for <samba-technical@lists.samba.org>; Fri, 30 Apr 2021 09:07:55 +0000 (UTC)
Subject: Re: Ubuntu's ADSys
To: samba-technical@lists.samba.org
References: <YIaZmO3WleOfenUn@pinega.vda.li>
 <vmime.608ab327.345.7841bc1123a20017@ms249-lin-003.rotterdam.bazuin.nl>
 <1d705810-cb2b-4012-6431-bf92cd5b213d@samba.org>
 <RCZBSQ.RP64LWX1DB4B@suse.com> <YIrXaNVMOKnOCt+3@pinega.vda.li>
 <aef2178b-28a4-baa0-1b54-8f4c7560fd4f@samba.org>
Organization: BaseALT
Message-ID: <6112d37d-e7f8-e3fa-0c86-15800aa64cee@basealt.ru>
Date: Fri, 30 Apr 2021 13:07:55 +0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <aef2178b-28a4-baa0-1b54-8f4c7560fd4f@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
From: Igor Chudov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Igor Chudov <nir@basealt.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!

Our team is also working on client-side GUI tools for Samba domain: 
https://github.com/altlinux/admc . I'm working under David's supervision 
to implement source3 registry (Python) bindings for Samba ( 
https://gitlab.com/NIR-Ginko/samba/-/merge_requests/1/diffs ) in order 
to merge https://github.com/altlinux/gpupdate/ with Samba.

Any help is appreciated because I'm new to Samba codebase.

On 29.04.2021 20:32, Rowland penny via samba-technical wrote:
> On 29/04/2021 16:57, Alexander Bokovoy wrote:
>> On to, 29 huhti 2021, David Mulder via samba-technical wrote:
>>>
>>>> I was curious why something that had just been released with a big fan
>>>> fair, didn't work, so I decided to find out why and, seemingly, I have.
>>>> The problem, from a Samba point of view, is that it depends on sssd, so
>>>> precludes the use of Samba. If 'adsys' can be forked to use Samba, then
>>>> that might be an idea.
>>>>
>>> Samba already does group policy via samba-gpupdate, and it happens to 
>>> work
>>> with both winbind and sssd. ADsys says they provide "password 
>>> policies and
>>> user access control, and Desktop environment settings, such as login 
>>> screen,
>>> background and favourite apps". We already provide password policies, 
>>> and
>>> user access control is in master. Adding desktop environment will be 
>>> trivial
>>> (and much of this is already in the works). We're providing policies for
>>> smb.conf, ssh settings, sudoers, scripts, and more. Seems to me we 
>>> already
>>> have more to offer than this ADsys thing does.
>> Note that we also have FleetCommander tool[1][2] that allows to define
>> desktop definitions for Linux clients enrolled into AD and FreeIPA.
>> FleetCommander exists for quite some time, we presented it at FOSDEM and
>> other conferences since 2018 or even before that.
>>
>> ALT Linux folks also have a comprehensive group policies parsing and
>> applying tool[3] that relies on Samba Python bindings. The tool also
>> exists for several years and will be present at upcoming SambaXP.
>>
>> [1] https://fleet-commander.org/
>> [2] https://wiki.gnome.org/Projects/FleetCommander
>> [3] https://github.com/altlinux/gpupdate/
> 
> 
> It would be nice if someone could update the GUI's page on the Samba 
> website, most of what is there now is extremely old and is some cases, 
> no longer maintained.
> 
> Rowland
> 
> 
> 

-- 
With best regards, Igor Chudov
Lead engineer
BaseALT, Saratov engineering department, UTC+4
tel. +7 495 1234-7-99 ext. 549
mobile +7 937 266-51-34

