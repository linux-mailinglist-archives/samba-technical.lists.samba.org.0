Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F2D24A7F1
	for <lists+samba-technical@lfdr.de>; Wed, 19 Aug 2020 22:49:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=v+zi6BpMkiftAZcdDB5LuHRP5IU+0cg4NMv64ZLIrNA=; b=IsbaWa1UAgH7fk4qVaC3a9js5f
	jPmIPeV5kL49tW74FO7rXzNVYsQUU+XwkxXrmiUxlixeWW6oRERINdQiCD8gZcFJ25VFxBv3dHQen
	bpf/weCX/IgvHXYNZs2Yxb3iAMv72EZMNTqARno2OW36WyvD0ApZSh+g9j8Ze0Vqee29xUsuJv2MH
	yVLwH1QxsmTI9lol/myaVtGOVjLDQCys80mroZ7EP723PBeE7NMMVqup+RsF8Pyp3gQzl8Fo8FScn
	HR0FEJrm+YGgflSRPkaCXy/vpe2QeXZwqKNpXFv5xjxsiUEJywWpjKP23wlf44SDGmRuNy5DMyaIk
	D/Ojkr9A==;
Received: from localhost ([::1]:51770 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k8V10-00ELd3-BL; Wed, 19 Aug 2020 20:48:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58794) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8V0t-00ELcw-HU
 for samba-technical@lists.samba.org; Wed, 19 Aug 2020 20:48:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=v+zi6BpMkiftAZcdDB5LuHRP5IU+0cg4NMv64ZLIrNA=; b=yvi98bYWK7h9PPyVglaTVGlsJq
 Eq7l75YxVbuEl5f8OTpBTg8DyntEWze/YWqboKouBCHpq3R/fgQNetadmAqmgnWeI0Cc1QW8LLm2Q
 IBHhZ+0OgpjdNMKIF6kSGBVHiqHfhLxapxK/v9axaTK26Qmb98szVaOzPVokjJp9rUPSfMcZqyak9
 AKgpEzJMvylWgnntjPCmuprBolBjI6I7T7XhIuL5U8bjLpLi8h6uYSy/VTT2xz/Hg1gCNX6jXYLkF
 c2r9pjhOBlcTJWPuF7oeAg7J2BBAFLPdtG5XORyAAuO5/5aZ6lTb0sSW6Xv579F/TDd/hkeeMPqWX
 BK4ur00kDUyLDUxzv7GdyweF00NQkfrHr+dM3EYxBbaCSjnPHgh/EsE4Xetl40GhGkRj89yclqJGn
 jbC2wTfHwQ4FhVWtypTRq5Q0NNjH2lkJJHI2DOGR7ZH/tddyIPPgqWB4kYRmNXWrjhMsZu3gEP2cA
 x7+fuGJPLy+fsqW/hdI4B6Rp;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8V0s-0004zT-4d; Wed, 19 Aug 2020 20:48:50 +0000
Date: Wed, 19 Aug 2020 13:48:46 -0700
To: Andreas Schneider <asn@samba.org>
Subject: Re: WIP: Samba's client command line UI
Message-ID: <20200819204846.GA3117@jeremy-acer>
References: <3749194.YmznvRLumo@magrathea>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3749194.YmznvRLumo@magrathea>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Aug 19, 2020 at 10:02:05AM +0200, Andreas Schneider via samba-technical wrote:
> Hi,
> 
> I'm working to cleaning up the mess we have with our client cmdline UI [1].
> 
> Currently we have a source3 and a source4 parsing implementation. I have 
> rewritten the command line parsing code. The only real difference between the 
> two is only how the config file is loaded. So I created a s3 and s4 config 
> loader and that's it.
> 
> The big change is that we need new options to fix a lot of issues face: The 
> biggest change is probably about Kerberos:
> 
> 	--use-kerberos=yes|auto|no
> 
> New is that we have options to correctly request signing and encryption:
> 
>       --gensec-client-protection=plain|sign|seal
> 
>       --smb-signing=off|if_required|desired|required
>       --smb-ipc-signing=off|if_required|desired|required
>       --smb-encryption=off|if_required|desired|required
> 
> You can find the code at [2].
> 
> 
> 	NOTE that this is still work in progress and no all the stuff is
> 	wired correctly yet!
> 
> 
> But I wanted to show you what I'm working on and you can comment. Using that 
> parser will break the command line options for **all** client tools. But I 
> think it is worth the effort, see [1].
> 
> Attached is the output of
> 
> 	smbclient --help
> 
> which I just migrated to give you a full example of the new parser.
> 
> 
> Feedback is welcome :-)

Fantastic work Andreas ! I'm really happy to see this.

