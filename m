Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A01C616010B
	for <lists+samba-technical@lfdr.de>; Sun, 16 Feb 2020 00:11:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=vI7kLh0uJo8X8KLc5GHN3nhCOLfL5+c3D63Si8xFlNw=; b=Yk+tikTRMqpTyG5LQ87FZwgZ2X
	pFG1K1C/qw/Z0fFBVTXXBU6VB3gWhxkVgmZsMh2tPXDIKrGcncuvyddfCWrHih5pS4gmgTw/1KeCy
	DLerYD0ty/cxvMpPwH9uGrYUqVU0b9Kb1w275lKk52U5lhZOoj/f7x4YiYO9FTlQRoOyewQb/txss
	b+nACltnWpHd4rscq0aCsfJkytMsIF8sKPqNxGPIWGf4bZw7m+RYuPQVfC8RDLis5d0o7b3dwFzHx
	CADxBOWpvhqPWqlgoZ2X5zBlPEz8quyC1WKF5SFRplK93/JtK+cPXBu+yuJy/6KSOOQvGTBRicH+P
	X/RkYIIg==;
Received: from localhost ([::1]:37718 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j36aA-00A3al-RZ; Sat, 15 Feb 2020 23:10:42 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:54738) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j36a4-00A3ae-7M
 for samba-technical@lists.samba.org; Sat, 15 Feb 2020 23:10:39 +0000
Received: from [192.168.1.110] (unknown [114.23.142.188])
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 1BCC181194; 
 Sun, 16 Feb 2020 12:10:09 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1581808211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vI7kLh0uJo8X8KLc5GHN3nhCOLfL5+c3D63Si8xFlNw=;
 b=PrRK8yGAQ0h3gvNopawYf0qQN1tETlU5eAfm9IWuoRKnkCCf06foJWKYEtOqOKZDDbhUTN
 wxvmvVhmoQUmhSGXmRDZ2Cx0xeR104vfN7Cu74mZxNxRwtQr5MbxoI23PA8BuvKjyuyidy
 GgB4KpU4sfOXqla1t0n4/U2VamQI3zHraOp95+9jOpJWRWAO8BkyG+GXFBG4Jr55vOOlKF
 ddmM+uzSWRB1Ui9XK+ixoL7btEPF0vrvTSWIRo4z0AKjNAjELnVAro4bEPRp1OjtZnOWFk
 Cpbw3p8GHX0+cMOa4ZJaVE72KOSrWIuBbb4+oAYDw7++fn0e93QyUhrz8nIgeA==
Subject: Re: too many layers in selftest
To: Andrew Bartlett <abartlet@samba.org>, Jeremy Allison <jra@samba.org>
References: <1f5483b6c7349f261b79990f3daea501d7636ffe.camel@samba.org>
 <20200214205049.GA51881@jra4>
 <ffbb3c2912a79ca4c32232280b0ce689597aa99c.camel@samba.org>
 <20200214210210.GB56355@jra4>
 <d5ecfe8e74ddd8d62ef76203fd8784d3cd7aee5e.camel@samba.org>
Message-ID: <7f8c06ad-11f5-52bd-2319-30f2cc081df3@catalyst.net.nz>
Date: Sun, 16 Feb 2020 12:10:07 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <d5ecfe8e74ddd8d62ef76203fd8784d3cd7aee5e.camel@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 15/02/20 10:45 am, Andrew Bartlett via samba-technical wrote:

>> The way the test environments are set up and
>> invoked is still a mystery to me unfortunately :-(.
> 
> There are two many layers:
>  - GitLab CI
>  - The bootstrap docker image
>  - autobuild.py
>  - make test (selftest/wscript)
>  - selftest.pl
>  - selftest/targets/Samba*.pm
>  - selftest/*/tests.py

You are forgetting or subsuming format-subunit and filter-subunit.

Samba's test infrastructure is a psychedelic fractal -- if you
stare for too long at any part, intricate detail oozes out of the
cracks.

> We got to this because each layer was added without harming the layers
> below, because incremental change is how we do things in Samba.  But we
> have built quite the contraption!
> 
> It would involve a closer commitment to GitLab CI (which might not be
> popular this week), but long term we could bid autobuild.py a fond
> farewell and distribute the data it contains between .gitlab-ci.yml
> (which also does the task of running scripts in order) and selftest
> (which could be told about which environments run in which job). 

Apart from the ordinary works-for-us inertia, there is a tragedy of the
commons thing -- people will pay for new features, but not for basic
infrastructure (or UI, documentation, security).

Douglas

