Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBF21C53F0
	for <lists+samba-technical@lfdr.de>; Tue,  5 May 2020 13:08:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=8rRMQo/KC7NpBkMyvXXKC7IYVC9JKkUJddcDvGL+EFw=; b=VsgWc5ckmbl9ijsmkyP/HTTWwU
	TWkE3ScgFmrhmN0jiw0rsDam3gKtZ6nlOfZgc/W8Er962nthq3HxW0+3ngbw7MjpyPQ+U+kJIou0x
	btehP06TysNDeIl2fNitZGVCvk3ym2I/BN6NWIsqBZdRqxdmX4/kFoNO5C8J4mYOC7Mhu6rEKt5p5
	4Ma3Qkcc4atxgVPQb1EZQ48R1xT/Q3JyRcJWDRYIbFuwNi7RbcPVBQcQfMvCD2I8O7mlQ750jvOgL
	7ImJhsvRo6O/jPf01vKjt2s7lHlEBgXxChMHuLEyLmMmqRynWefzG6DovHneQxvNAxVUNCXBVp4dZ
	fr6gAw0Q==;
Received: from localhost ([::1]:22362 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jVvQX-002mmQ-5k; Tue, 05 May 2020 11:07:53 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:33170) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jVvQQ-002mlE-Cm
 for samba-technical@lists.samba.org; Tue, 05 May 2020 11:07:49 +0000
Received: by mail-ed1-x529.google.com with SMTP id j20so1509093edj.0
 for <samba-technical@lists.samba.org>; Tue, 05 May 2020 04:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hYN2yK0J7NncsqKSJi7zEJwi/FW8tRh4M0uxvhghdiY=;
 b=g9OxvuyGOvqupYjUUh7sjbHaVt0IyJ/YGjgO0c53XDeXjiVIEUXZVf99wcbWlXu9Xn
 Nd8FCwSQ+7J3Yyy4ncFi48qO5lniQT7MA3EoYMOW0aad4dHzDc4LxtJaR6LcQ4ZmKlkT
 LTMi+BoMesiNi3k+lHWxzKMp6bG4ssIOKkH5oY1aqa9tgb4a9G9xZgHkx0zz/6QgWj28
 N1kLhX+6Suh6mJFmYSEyT79sZ8gvaGtmcaBEYUsREdwvUED6hl5UigF9sr48gCPFbhNU
 cXZGaFrIYlZN3/gvzcn5g1WQjFSjTV+NsGhFAiPl5J/WTMqZ/rTXFCvId4g3LLs+XfEq
 BWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hYN2yK0J7NncsqKSJi7zEJwi/FW8tRh4M0uxvhghdiY=;
 b=jyQ/3jmhmsDwaYQ0FzG8mlr398QNoKVf0Ufw5FwLCeAf04+ojvzi3lrhLUBm8jEjpe
 QVTJlZ/lWl9LwMR9lnIc/3p+CyG42GJ0IkbTMF3qyoMYv26oZLr/z+6UWg6FYGGwIl6w
 Y/WmQWeVkJ8/ZSQ2iyFJ9QBB2QRcyznjyMEmlkLaAsfMCCcomJn/8MVJELG697me9dNO
 +pw7LgUyk0dg/6ixGFjyEs+vU1Bl5RyGyWv02omxCYd2cKFvUmdmessCeeY8soiat3Jj
 L8wxmIVXVb9Pr/X1rKUmedlgtMczotTamaWDm2pWFXujxIvU72oZnM8LIlaMs8okL2U4
 LFJQ==
X-Gm-Message-State: AGi0PuZManxcf5/HPKbpG/kErxIvN1FGQDG35n0v3dBB1F3HOlzZoHFY
 lUfTk2vZdXxB1Prnc8nOwlQHTlcFhS8SfKRQvgE=
X-Google-Smtp-Source: APiQypLx9WYCAE8gGzsyjqAvqwZ9ZxDULZG32isflWGZFW0B4/1FJF9oeKsKwbIQAy4ub8zHvKfeowX17tDbEHdcx+w=
X-Received: by 2002:aa7:c306:: with SMTP id l6mr2079569edq.356.1588676865599; 
 Tue, 05 May 2020 04:07:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAH72RCX2B3z1Mv+R32yYA0GnpQY-WX7ustGtS3Npui1Dh_L+FQ@mail.gmail.com>
 <20200505104319.GB5779@onega.vda.li>
In-Reply-To: <20200505104319.GB5779@onega.vda.li>
Date: Tue, 5 May 2020 14:03:10 +0300
Message-ID: <CAH72RCXUUsdDQyZDnx-28jZZKeMrwtRixQ5YhokeMAvfpeietg@mail.gmail.com>
Subject: Re: GSoC 2020 Community Bonding Outline
To: Alexander Bokovoy <ab@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: hezekiah maina via samba-technical <samba-technical@lists.samba.org>
Reply-To: hezekiah maina <hezekiahmaina3@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thank you for the information.

On Tue, May 5, 2020 at 1:43 PM Alexander Bokovoy <ab@samba.org> wrote:

> On ti, 05 touko 2020, hezekiah maina via samba-technical wrote:
> > Hello everyone, my name is Hezekiah. I have been selected to work with
> > Samba during this year's GSoC. I'm excited to work with everyone in the
> > community during the entire GSoC period and become an active committer
> > after it's over. During the community bonding phase I'm hoping to engage
> > with the community members, getting to know the history of Samba, how
> > different people contribute, which projects the organisation works on and
> > possibly contribute few patches before the coding phase begins. Any
> > resources from the community aimed at onboarding new members would be
> > greatly appreciated. Looking forward to working with you all.
>
> Welcome Hezekiah, nice to see your interest.
>
> please see https://wiki.samba.org/index.php/Developer_Documentation for
> existing materials we have, especially around 'How to contribute'
> section and 'Debugging / Testing'.
>
> Since you are going to work on integrating Samba AD DC and Cockpit, your
> work would benefit from the user documentation we have at
> https://wiki.samba.org/index.php/User_Documentation, including how to
> set up Samba as an Active Directory Domain Controller, since some of
> those steps would need to be automated in your Cockpit app.
>
>
> --
> / Alexander Bokovoy
>
