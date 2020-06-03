Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E34E51ED22C
	for <lists+samba-technical@lfdr.de>; Wed,  3 Jun 2020 16:35:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=NHUDMvA68asC5DNsEalsPNAY2HUu/IjyicXtrRou/6E=; b=HvBtcAbvL08nUj/AZK17tuxJnf
	kzVl9fh2W4IkqB6auToXkWVGg6Lao/2mEp5RP6A1HRxXw5PwFGjVLLpQUEeqTV83zlL5EDmgYM5gf
	hlxcvB5LuBXYOH0U+C4QjXx0jAsCxqCFKXsMdFZUBS6+z2vrmZs8SnWDGT+nWDAQe520EToC7ufl7
	Cggq8wG8PhANu83oC4tKWiydIbg1sCmjHNr+lyOpvoGSSQFfKT6P4pW9TjUr3q42+/ZYT537uguYY
	CtOzWNBuu5atDc2DX0KhSTGsiivzVnmmotsbiAUrI1jJnkM52o0wgtVs5mewYUvLAFBGiOG2QkbFd
	kA87Mkpw==;
Received: from localhost ([::1]:31862 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jgUUL-008eat-9M; Wed, 03 Jun 2020 14:35:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41820) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jgUUG-008eam-6Q
 for samba-technical@lists.samba.org; Wed, 03 Jun 2020 14:35:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=NHUDMvA68asC5DNsEalsPNAY2HUu/IjyicXtrRou/6E=; b=H+IJRGf+Fmrdxp7KGKmDyDbk01
 9jQPjsqp+qKdJWiIgLg270QuYTDsTn9Vf+vEZkvHodeRpPqMANkinaR8Z63AlwZGBX5rJ6QsNPG2D
 +ae93bFihXoq5N0uId0f4jBLE50xMn7u00wnDj+lHzGJMIswv+6ELIH6gC559pGbSEHydAhy0excW
 sfBeAGnYi1cXXWjI1H9cgP2tXQ6+IweHvIbRiz/Ej/NPAAa0ifonHIvwLkRrisLPxzmrNWrQl8q+C
 6W25dykt46JXPk7W+LlmlQKjnDGCIVqNZlKZtYSnwChGtgNfFcbtDa1s9Sy2e2OmX3PHohP1IkN+Q
 0D+CFsnbDqPBuFxZTOVMjmPG0n3LeRtVUkpgN1nAHfiQHGRa9B65Rwp6/5epdk4pJIlWUyqgrsAc8
 NdRuw5kNCM1dCYVmpjApD2wGsPV2TIrc1AHrNV0GAVnJlvtVKczAmeHBjptSThTGebAR2VD5ygjy9
 9PU6/vi47o9cO94ktqZXRdtW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jgUUE-0004dj-Nd; Wed, 03 Jun 2020 14:35:23 +0000
To: samba-technical@lists.samba.org
Subject: Re: git signoff+ and review+
Date: Wed, 03 Jun 2020 16:35:21 +0200
Message-ID: <2877725.qJPT1UHR8W@magrathea>
In-Reply-To: <2070261.IvKQ8U6GgO@magrathea>
References: <2070261.IvKQ8U6GgO@magrathea>
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
Cc: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I've pushed some improvements to the tools ...



On Tuesday, 24 March 2020 11:00:11 CEST Andreas Schneider via samba-technical 
wrote:
> Hello,
> 
> as a daily task I have to sign commits and also add my review tag after
> inspection.
> 
> As git-filter-branch has been deprecated and the replacement is git-filter-
> repo [1], I've written some really nice python tools to make my life easier.
> 
> In a git repository I and do:
> 
> git signoff+            # Add my signoff to commits I authored.
> git signoff+ --by metze # Sign commits authored by metze,
>                         # because he forgot :-)
> git review+             # Add my RB tag to commits I'm not the
>                         # author of or which has my sign tag
> git review+ --by metze  # Add review by metze
> 
> 
> metze is a shortcut, the name you specify is actually a file name placed in
> 
> ~/.review
> 
> so metze is actually the file ~/.review/metze and the content is his name
> and mail address.
> 
> You can find 'git signoff+' at [2] and 'git review+' at [2]. Just put them
> in
> 
> ~/bin/
> 
> and git will find them.
> 
> 
> I hope they will be useful to others.
> 
> 
> 
> 	Andreas
> 
> 
> [1] https://github.com/newren/git-filter-repo/
> [2]
> https://git.cryptomilk.org/users/asn/dotfiles.git/tree/git/bin/git-signoff+
> [3]
> https://git.cryptomilk.org/users/asn/dotfiles.git/tree/git/bin/git-review+


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



