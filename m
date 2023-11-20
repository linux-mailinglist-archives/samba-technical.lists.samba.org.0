Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 102037F15F1
	for <lists+samba-technical@lfdr.de>; Mon, 20 Nov 2023 15:44:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=xQIBUFuyIR25RCI+XggjlTvvAc/LKwr/taeAWi/VrfA=; b=vUPPUzwal72K3fwCKF5OshHxUn
	Bxq99y7wDYwJUu0aRTa+G/rPVRaEzFejAfAOB3ugZDcSG1pr2X/5/4w2brVrZvARVJpcHYteBCm3F
	qh6C+BetFGZGZz7/Fa39yhRbfImQ21LY0/LLTmqMxdTMfUYFaqUCPaYhS6sfvoNmtSQzFn0ORJCCE
	NYeErIYqtixiP3PyA55mgdupmbIJx1hEfbPRAfc9Z1CSUxAL4wHFEWuWqJzVraOT2qusH0C9MQOrZ
	8ATuEjDXyVqYxefAscuq6MA9vakPDxf1dPJynixB/1Jztrt8TSwuKqMztKj8V144YvPVyPYSVJ/TX
	cPkmBNOg==;
Received: from ip6-localhost ([::1]:41172 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r55Uv-0091j8-5Q; Mon, 20 Nov 2023 14:43:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47266) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r55Up-0091iz-BK
 for samba-technical@lists.samba.org; Mon, 20 Nov 2023 14:43:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=xQIBUFuyIR25RCI+XggjlTvvAc/LKwr/taeAWi/VrfA=; b=ceNSjcKpAoJb5NmzZPlo+358vY
 e6iCLZnCjb8O0jT9nM+cLtbCWpcmayc1g+NLvh4aIQGCwICoWHUBACPs0WcofSUPSns3wNmeQH1K8
 COWyUANUHTVhPqGcyFOoXQOZ3Cni+VNkSyZ4ZsxOvMQWIoWq2qBt1hzWLfDLV68ZrBwnHPgGg5WOY
 anWYv5JaQ/WmVi8/yUjMLaYs5xsLjinV2L8wy9oG4kFC6zxYJpTRr83o5TWwobLYI60H8MB1dK39Y
 alzz1dpRHPd30ahhCxr/0EXpLHIyKMVv99m/AHhQJEM0RxbbmjQG3RqRu3MyJXbTbdsaPf7tohzaB
 Tcjt8f9v/4VUlBCsyLI3eb7NCrkEKDF/hGhT9+oKY5gxsNctZYZYPuIn8ecdvW9KUEeZNNUNeEAG9
 TvN2oZJ/YpEWT8H42OEEETb396/2qmBtMwpy1twuvAARSB94u2/pbzfIrBYEyjmYakz/qZR3WFh0Y
 pckzvPBkI4CcybNfPKRyR6Ry;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r55Uo-007Am0-1A for samba-technical@lists.samba.org;
 Mon, 20 Nov 2023 14:43:30 +0000
Message-ID: <3bf22a9f-ed05-baa2-3698-5870ca9e957a@samba.org>
Date: Mon, 20 Nov 2023 07:43:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [SMB3UNIX] Add POSIX-FSA and POSIX-FSCC
To: samba-technical@lists.samba.org
References: <b63ead3c-f0dd-4acb-ae01-14e887d1d03e@samba.org>
Content-Language: en-US
In-Reply-To: <b63ead3c-f0dd-4acb-ae01-14e887d1d03e@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: David Mulder via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Mulder <dmulder@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


On 11/18/23 12:02 PM, Ralph Boehme via samba-technical wrote:
> Hi!
>
> I've worked a lot on the spec over the last 2 weeks.
>
> I've mostly finished POSIX-SMB2 (the existing spec, first link below) 
> and while working on that I realized that it makes absolutely no sense 
> to have filesystem behaviour in POSIX-SMB2, so I've started a 
> POSIX-FSA document alongside POSIX-FSCC.
>
> Naming convention:
>
> I'm following MS nomenclature, just replacing the MS- prefix with 
> POSIX, which gives POSIX-SMB2, POSIX-FSA and POSIX-FSCC. With these 
> it's possible to have nice and consistent cross references.
>
> Current WIP:
>
> https://www.samba.org/~slow/smb3_posix_extensions.html
> https://www.samba.org/~slow/fsa_posix_extensions.html
> https://www.samba.org/~slow/fscc_posix_extensions.html
>
> I've created a project for this under the Samba umbrella on gitlab here:
>
> https://gitlab.com/samba-team/smb3-posix-spec
>
> WIP branch:
>
> https://gitlab.com/samba-team/smb3-posix-spec/-/commits/slow-wip
>
> The hosting of the spec on Codeberg feels a somewhat odd and having 
> the spec hosted where most contributors already have an account 
> simplifies collaboration. We can of course continue to push master to 
> Codeberg once in a while to have an independent hosting, if that is 
> what some might prefer?
>
> I'm planning to finish POSIX-FSA in the next weeks. I'm happy to take 
> reviews, fixes, improvements and "you can't do this!".
Great work Ralph! Thanks for working on these. I'm fine with moving it 
to samba gitlab.

-- 
David Mulder
Labs Software Engineer, Samba
SUSE
1221 S Valley Grove Way, Suite 500
Pleasant Grove, UT 84062
(P)+1 385.208.2989
dmulder@suse.com
http://www.suse.com


