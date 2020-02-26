Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D7595170111
	for <lists+samba-technical@lfdr.de>; Wed, 26 Feb 2020 15:22:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=QS+k+ZR9tVeEHKWML1uiY6Y2WJxu79z4LkJNsVawp1w=; b=oUfKLWF6lXVXIa4GtzKjvVWgAO
	S+xxkjXAcbqwyjPz84DMaxYVwnM3JB+LeQX3MZIYFILMjAaqRqq3yuq0I8ct4QIsy1xsDz5ODbBC6
	Jei8ZDKm/JztyVCODLupfu0QXPIb6YMXbOm9XZ54kYd7cCQshBMP8X89Xq65syWaeUPfIK52woHwj
	GDqgY30/q5OmQ74Xu1MKNdsXsXf0oGMXo264asH+fvo+8bZfPIPeOK7eWzgpFSqpSsvJ8PYvNyF9D
	nID4KpGzmuyi7YEeCQtEt6QTEb9i+Gpc5JCQmIXvQHXEg76VNd1rCJhpliINqFrBlx85QT5ZWh1gG
	ZCky8FuQ==;
Received: from localhost ([::1]:50590 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j6xZL-00Bn18-JY; Wed, 26 Feb 2020 14:21:47 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:41431) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j6xZH-00Bn0Y-CS
 for samba-technical@lists.samba.org; Wed, 26 Feb 2020 14:21:45 +0000
Received: by mail-lj1-x235.google.com with SMTP id h23so3289963ljc.8
 for <samba-technical@lists.samba.org>; Wed, 26 Feb 2020 06:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QS+k+ZR9tVeEHKWML1uiY6Y2WJxu79z4LkJNsVawp1w=;
 b=nwmO85OmFxJ0220tQHstScMGWP1N7MVWuFEUTqa1JblrvcRJ+//n5y3KpIVX4aip0j
 gN54ICa1z7TRjfQ23Jpdj5Gu3zpYegVyPL6azFZ1Fw67p6DRGCm+t6Tc5nRwVlXDNss7
 BvWkAdV9rUWpNByppFTY2s9oZfF9pNYW9kTeS2FH7zeUqR1xwFcSrBMnaK+6C2gsFacz
 T+LZhFfPx+m3KdRsiinl88VHjdhj0SnAk5VQGhOdG9kvfsTPNkr+O+QPfSJlGdCrZ29k
 +HU9AQAC2igoe/fvKPvRq/Eqo7BddihIdl9vapspkYXg0NlJ0b0aDuaMLNKfLfXsPQZk
 KjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QS+k+ZR9tVeEHKWML1uiY6Y2WJxu79z4LkJNsVawp1w=;
 b=bD1hYVRNAkkQQoz46KB5ARlomcTqERISbXbqDqMldGzUS0DVYWKayl9bnjn5Hb29ZC
 hgRGDTtdnieRpLPSOQpsWG8BsfOKkoYMRu8G5KzicboyNeNbs2dPxeozkQSbft1ojEHY
 FO70JYbDAlXkydQ4djzshGiQEa2T8+khbi8jpFpSrWRlJvV/ECrUpYf3yMueUuzGJRZt
 E/OpZfSte0Gt8lZ8nLdmMNeLTZAEuR0wD9se3NatMRK4a6ezivWyM4xOCldkPcWA/Z/y
 3xsBaz1FzujDye6ggIO5hAJgSl15CdTvjIiMZHWAhILzaN8t5o0h/nnT541n2oT3ed2G
 2Jpg==
X-Gm-Message-State: ANhLgQ2cYW+y9QObAhB5EGrpWoqs0F6CcNq9h/Rp5S73OoRHtDNJpPzh
 S1fdGYfaeLqneIC4XhobCa38m8hW0xJ3+SK2NcEC0phz
X-Google-Smtp-Source: APXvYqwaCdVd8CKcsxrywXhdLu7iABBeE1/exDJgg7Kv2DtHFxNPRaCJBOasY0WFy/iYHWRgKdEhGs/RvRz27xEL1VM=
X-Received: by 2002:a2e:5304:: with SMTP id h4mr3134863ljb.75.1582726901644;
 Wed, 26 Feb 2020 06:21:41 -0800 (PST)
MIME-Version: 1.0
References: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>
 <6408dd32-53f3-2622-d6b9-04928793cc8b@samba.org>
 <CAC-fF8SF+FUQBWxsPnSRtAXEqE=TWBm0Meb8swERSvHqpQf0yw@mail.gmail.com>
In-Reply-To: <CAC-fF8SF+FUQBWxsPnSRtAXEqE=TWBm0Meb8swERSvHqpQf0yw@mail.gmail.com>
Date: Wed, 26 Feb 2020 15:21:30 +0100
Message-ID: <CAC-fF8SFX0ndOpY2w9zASJd8FagnT_6Mh0Xd4=ejQKQYDcK-uQ@mail.gmail.com>
Subject: Re: ADV190023 | LDAP channel binding support
To: Stefan Metzmacher <metze@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Andreas Schneider <asn@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Feb 25, 2020 at 9:17 PM Isaac Boukris <iboukris@gmail.com> wrote:
>
> > I looked at it a bit, see
> > https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=ac8fd11f1d4b9deb48d6c7942af0c83b52d69d7f
>
> FYI, I got net-ads working against AD server by adding some logic in
> source3, look:
> https://gitlab.com/samba-team/devel/samba/-/commits/iboukris-metze-cbind
>
> However the fixed clients aren't working against samba server yet,
> unless require-strong-auth is set to "no", while non-fixed clients
> still work. I get this error (I also wonder how can I trigger the
> source4 client code).

Actually, Windows client seem to work fine against your source4 server
code, even with require-strong-auth=yes.  So I'm still missing
something on the client side :(

