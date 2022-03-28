Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E03234EA0C1
	for <lists+samba-technical@lfdr.de>; Mon, 28 Mar 2022 21:51:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=4jFYXquRXH+Ch6riYfywXBIz1vCcB8ZzxJ5IQvhHKCA=; b=mn2272xymy40GZmA1+rc4+ngm/
	RZhHjFQX+mFPZ51v22x0ht4xk8CRgVDnP/d6pxj0EMyDIkwrHGoGQ/plojXsHC2Z7xcfpc7WhK2mo
	djiqBB49a/FjAI0VoIZHFgJHzDUbqgPpOsFa+wDFLNH8eVBdoeaYfJpqnWz6YKw7CYKX2ymATU0Cj
	krWvWLXAvldTYQSfFfNDjAeM5OgABC7EOAIvYTBnUoV1mW8eGFCr8QkD86BMlbiVSzxhYf1J5ZtLS
	2sYyJOYRSm9MCXpsYm5dCmKeIsxg6W32VJizY+GIJ+a26O5+mmh46NTX7EJ8ayDw0LK1NIlj8sse8
	8dqKu9Zg==;
Received: from ip6-localhost ([::1]:56428 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nYvNq-00646J-Bz; Mon, 28 Mar 2022 19:50:34 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:45025) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nYvNl-00646A-Lc
 for samba-technical@lists.samba.org; Mon, 28 Mar 2022 19:50:32 +0000
Received: by mail-ej1-x634.google.com with SMTP id lr4so22436916ejb.11
 for <samba-technical@lists.samba.org>; Mon, 28 Mar 2022 12:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4jFYXquRXH+Ch6riYfywXBIz1vCcB8ZzxJ5IQvhHKCA=;
 b=N0lr9MW9QSQZDifrilpQsKtJ/jIX8gOxgRhx8uhSAUHFVJNIye4Q8EsCHR7bhptEYr
 j43W87jRpvLUReiHpf9t8olHi6QOpMtb6LmMqJJDvxWR6edyiA2BUeumvgS9yAgF+cgJ
 TQTqr+ZOQ5go/llVYfToPbSbEXhEQrVsY4ZyXkdjw4AzHncKunQZdKiNjHeWgHwbjzQW
 VvzWEhD9cPRwDjpFR2gP6hFtz1WWhq2/5EIeMPu6NkjQ+s6SyUh1ys+s9O9EtXDe7qfS
 +iF3QDT2q2DssR7CTg3gYhXVdoDy/DhEs7390EpaqkO3xXnmpwcBeC56BlUnsDN/ETqQ
 /JrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4jFYXquRXH+Ch6riYfywXBIz1vCcB8ZzxJ5IQvhHKCA=;
 b=Jb8/NPIar9ve7vvwKL9uLkvFtGJJK7i7jLO76O86/Mw20/SJn3P6NylmJPpzwY60Lw
 ix5JGeBHbW0yJyJXShCScjivsCL8WL+yv/Ay98UCHRNAquaHUts29Bj6XigCtFuUuV9x
 KYOMx9WgcvQ+wyd5kljHGtRyhd9wEVYHjtg2v6uIeB4kwfJjG4PdNQGNT4BrbiwSEmKW
 hG79Mp0zuilUhH+XVGn5+MpgJP6IZG38OFfpYS7z9svFNHMcCCP2L8fVCccsd3XZ/8Zi
 A0ezOKh0fr0NB32nnvwu2U+7jF49VbJs+Nl1F+j3v8cO0up/2Zg1YuCniTi4mSfnfDMr
 r/dA==
X-Gm-Message-State: AOAM533A/478Q5v0F/mQAck0jsyQmuDFjmHrGVox9N4uNpLuZn0N0k/9
 lwFODxoXEwFq7Kr1q/ybfpxqLECgh0nfMexDOws=
X-Google-Smtp-Source: ABdhPJyYOv2HrqH9E15+PBFqbUtL4TnbnbslnfvD2O7zpPR/Ds0/J/7WhOLoykWHikkOa/IsLcJpKbwBhUiHoI8xkjM=
X-Received: by 2002:a17:906:c149:b0:6df:f047:1698 with SMTP id
 dp9-20020a170906c14900b006dff0471698mr29861365ejc.16.1648497028923; Mon, 28
 Mar 2022 12:50:28 -0700 (PDT)
MIME-Version: 1.0
References: <CACyXjPw0iqTm=HE9Neb=J99wZ0+=GRdQ0+13+BAuDvvLvQeWaA@mail.gmail.com>
 <YkHeJrztO2KnRMpn@jeremy-acer> <3853301.dWV9SEqChM@edfu>
In-Reply-To: <3853301.dWV9SEqChM@edfu>
Date: Mon, 28 Mar 2022 12:44:46 -0700
Message-ID: <CACyXjPwFhse8VtiuitVco-Q9UtpzUSwk3xxUz020rK7M=gtp4w@mail.gmail.com>
Subject: Re: Are there Python3 libraries for the net commands and etc?
To: John Mulligan <phlogistonjohn@asynchrono.us>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Richard Sharpe <realrichardsharpe@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Mar 28, 2022 at 12:44 PM John Mulligan
<phlogistonjohn@asynchrono.us> wrote:
>
> On Monday, March 28, 2022 12:11:18 PM EDT Jeremy Allison via samba-techni=
cal
> wrote:
> > On Sun, Mar 27, 2022 at 09:21:38AM -0700, Richard Sharpe via samba-tech=
nical
> wrote:
> > >Hi folks,
> > >
> > >A lot of system management scripts these days are implemented in
> > >Python and I am sick of using popen and system in python to run Samba
> > >commands and then grub through the output to figure out what I need.
> > >
> > >Are there any Python3 libraries that provide the functionality of the
> > >net commands?
> >
> > I don't think so. The only python SMB stuff I'm aware of is:
> >
> > https://pysmb.readthedocs.io/en/latest/
> >
> > I think only Samba does the management stuff. However,
> > most of our management stuff is drivable directly from
> > python, as that's how we do much of the testing.
> >
> > Talk to David Mulder from SuSE or some of the Catalyst
> > Team as they know much more about this than I.
>
>
> There's also https://github.com/hamano/pysmbc that I used in past project=
s. It
> uses libsmbclient, rather than being pure python.
>
> However, I do think Richard Sharpe meant management stuff. I am also very
> interested in doing less fork/exec/parse and make more use of samba libra=
ry
> bindings for our `sambacc` project. Personally, I keep meaning to spend s=
ome
> time digging around in the samba-tool code. Since there's some overlap th=
ere
> with `net` around things like domain join, even for non-AD-DC servers, I =
think
> there *are* some existing libs to do a lot of these actions. However, the
> documentation is missing/not obvious. One of my big stumbling blocks when=
 I
> see a package/api that seems to be something I want there's often a lack =
of
> clarity around how to make use of it due to stuff like undocumented argum=
ents &
> some magic numeric constants, etc. However, its been some months since I =
last
> looked so things may have improved too... so take this with a grain of sa=
lt.
>
> There was also an effort to add JSON to some of the commands. If smbstatu=
s and/
> or other commands had JSON output we don't have to do low-level parsing o=
f
> output, even if we still need to fork/exec/read. My team was interested i=
n
> this but we didn't have sufficient bandwidth to actively pursue it oursel=
ves.
> However, a teammate alerted me to a new MR on the subject earlier today:
> https://gitlab.com/samba-team/samba/-/merge_requests/2449
>
> Anyway, I just wanted to reply to say that Richard isn't the only person
> interested in this kind of thing. :-)

To be more specific, here is what I am interested in:

A python (3) library that provides things like:

smb_mgmt_net_ads_join/smb_mgmt_net_ads_leave
smb_mgmt_net_ads_status
smb_mgmt_net_conf_list
smb_mgmt_net_conf_setparm

and every thing else :-)

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

