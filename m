Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CB82909A0
	for <lists+samba-technical@lfdr.de>; Fri, 16 Oct 2020 18:24:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=wVgXLHoMUwvnvyTW2yIZ6knUBHvLi+PxmAGAslGnktk=; b=GktAnnDpA108HWlGJno/HAGBRk
	OavHCgazPx6bHmJ+3rXVF+PtkS2lrbkQaqcHJgqrhuiV0zrLZ7ATlCduh+duoMkEpMLSjc5FuYYbS
	hRJ2x2bL5CDP450qQKh6Erm6DzBOCdGkI3sXcz+b1wb3mfhDOz4INf9lj0M51pK8VLkOmSEXDDPQ2
	Jdm/23G68GCPiqmpStyh5yHpNPq8SARLafM0Ojz8goc8QgKLGZl92UzoLsB5mYu9DKfWf17GzT2py
	bEuMtqxh+AAyF79DzlfwaNWNKrN61d5SUacxQDlLdtP/DfOeG69W3k0/w81L4VgIpkETbubKJfA6N
	F9qrdUZw==;
Received: from ip6-localhost ([::1]:49420 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTSWS-00CQ85-57; Fri, 16 Oct 2020 16:24:04 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:41895) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTSWL-00CQ7y-Qx
 for samba-technical@lists.samba.org; Fri, 16 Oct 2020 16:24:01 +0000
Received: by mail-lf1-x131.google.com with SMTP id d24so3652788lfa.8
 for <samba-technical@lists.samba.org>; Fri, 16 Oct 2020 09:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LB9+72E3QFZCliTH2XyVD9UzunypKbtGr9gbmtF5wLU=;
 b=AGWje1B7C9ZwMaCJ/Q1M7HmhzmsW+NQ9xxuqF+xJsgz7Rk22Mx2ldorjhaNmn1/mX2
 D175sN+kODATnsQWw3J9D2vGc1MJiO7V+pjUOMlbAasOTPkUFjyidAXLSnvfYG+7/En5
 DpaBOyOWloDVKm5ZhUDhd1zOz7mPMRNGKa0I1FbSzTvyg5Oku0NFjndBYZMH1dsxPtn2
 0zDYCqijlESCtHPEBjLLvmkTcaOr816oodxPk9i4H8CNAOcuxW4tcHDGEljxSng81q4v
 f1CtDl5TNp//2XvtMkasmSmt5Xas/jGWh7dXcGhXt+dDRQQ0nhtoX/NeBK2icyW4zWdi
 I28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LB9+72E3QFZCliTH2XyVD9UzunypKbtGr9gbmtF5wLU=;
 b=VYmLj+AuXl2y3hroA3g0kj4fSBh8aqLOAX9UqVpkWuIcxqwjWX3+3aa6448zqazTZw
 TA6qAW1gSrEdx9t1zQfMnvN+q7mH8ujkvF1VZDxpDsqO2h51weI1R1/NZ69Ffjy6WvZl
 OAUHJhvUeKyVRyMMTmV/mIJmwzznrmhfSpFHluyk4BDAq2TDqrMrlomIK2uLND608qrx
 GAiYluHNQ8ch1zf6S2S4C/OMT22F71KkI8YaGsd5OvW5yn1f1S88tA2VO08knXSYnm+d
 sucD1/gNK1vGjhM4USuP0zXdLvtZSdXlgz0wPbv6/6DHQfhFNn3kegQ7Cx5sdGkKdqfn
 DLtQ==
X-Gm-Message-State: AOAM532K34PKhokkKaGg0g8ENKI9nYGtMYnb2RuUU9O1KpzobOZ4IE6l
 42tW5qzJ/qW4dHoJ4cb7F44nos58tqkarZOFMxQ=
X-Google-Smtp-Source: ABdhPJy1o2NSZ4K9a2cAQPtE6V7zMYqOgDMvYCjcucIAFHzsfvyqZVMDlJne0wNPqXU8q/pVK5JJ+oOmb+qDmOiBgAg=
X-Received: by 2002:a19:c381:: with SMTP id t123mr1519944lff.499.1602865435818; 
 Fri, 16 Oct 2020 09:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mtwBHTk-Xoeuo+RbgNwiNw-cWTAhdy1YG5y+vXnNDSv4w@mail.gmail.com>
 <bd8f21ed-5fd4-0974-f15a-16d2f3ee607f@samba.org> <87r1q3hixr.fsf@suse.com>
 <827fd43f-40a9-9480-a6b9-aea1fa69090c@talpey.com>
 <CAH2r5mt3t=FHVd8RtCyrzY6TUKb+rGENENXbKJBgUdq4T4Qe6Q@mail.gmail.com>
 <CAH2r5mu72VSPFhiLjL3YUtStXc1=B5SBP86+A5vEWFhLFyOJBw@mail.gmail.com>
 <CAN05THRAZnea1NUW7-h5jHsQ+yUpvxO-5KHGaFgKB87JxmWBqg@mail.gmail.com>
 <55b0a562-b6cc-b6d4-65c7-b642ce08cc4b@talpey.com>
In-Reply-To: <55b0a562-b6cc-b6d4-65c7-b642ce08cc4b@talpey.com>
Date: Fri, 16 Oct 2020 11:23:42 -0500
Message-ID: <CAH2r5msG_3P-Bey-Jc=D+n-0Xaop9Zo3CuKGkKWyths-OXUXig@mail.gmail.com>
Subject: Re: [PATCH][SMB3.1.1] Add defines for new signing context
To: Tom Talpey <tom@talpey.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Stefan Metzmacher <metze@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

It is in windows server preview that can be downloaded and windows has had
similar approach to optional features configured through registry and not
turned on by default, otherwise impossible to test and if no way to turn on
for Linux would delay approximately two years to get in distro after in
windows

On Fri, Oct 16, 2020, 09:27 Tom Talpey <tom@talpey.com> wrote:

> Indeed yes, my point is that until/unless Microsoft indicates
> the new signing context is committed to the protocol, it's
> premature to bake it into Linux, or anywhere else. Speaking
> from experience, things have been changed or removed at some
> very late dates, in fact.
>
> While I have the floor, and just a personal opinion, I feel
> there is a huge and confusing proliferation of module options
> and mount flags creeping into cifs.ko over time here. Is this
> really a good idea?
>
> Tom.
>
> On 10/16/2020 2:11 AM, ronnie sahlberg wrote:
> > Looks good, but I think Tom's point is we should not put this in
> > upstream until the feature is officially launched.
> > In  wireshark, we can add these things immediately since any capture
> > files with these parameters will continue to exist forever.
> > See wireshark still supports pre-RFS versions of iSCSI.
> > But for cifs.ko we might want to wait sending to Linus until it is
> > officially released in a consumer version of windows.
> >
> > Lets just look at SMB2.PDF and all the bitfields/flags that specify a
> > feature with description and then the comment that it is not used,
> > clients should set it to 0 and servers must ignore the flag. Things
> > can change until official release.
> >
> >
> >
> > On Fri, Oct 16, 2020 at 3:50 PM Steve French via samba-technical
> > <samba-technical@lists.samba.org> wrote:
> >>
> >> Here is a patch to add a module load parm that is turned off by
> >> default to allow users to enable it for experimentation
> >>
> >> # ls /sys/module/cifs/parameters/
> >> CIFSMaxBufSize    cifs_min_small           enable_oplocks
> >> cifs_max_pending  disable_legacy_dialects  enable_signing_negcontext
> >> cifs_min_rcv      enable_gcm_256           require_gcm_256
> >>
> >> # cat /sys/module/cifs/parameters/enable_signing_negcontext
> >> N
> >>
> >> On Thu, Oct 15, 2020 at 11:50 PM Steve French <smfrench@gmail.com>
> wrote:
> >>>
> >>>> suggest wrapping this context and the integrity algs in some kind of
> conditional
> >>>
> >>> I have a couple patches to send the context (which I haven't merged
> >>> yet, because, similar to what you suggested, I wanted to make sure
> >>> they were disabled by default).
> >>>
> >>> Tentative plan was to have them disabled by default, and sending the
> >>> new context can be enabled for testing by a module parameter (e.g.
> >>> "echo 1 >  /sys/modules/cifs/parameters/enable_signing_context"  or
> >>> some similar config variable name)
> >>>
> >>> On Thu, Oct 15, 2020 at 1:15 PM Tom Talpey <tom@talpey.com> wrote:
> >>>>
> >>>> On 10/12/2020 5:50 AM, Aur=C3=A9lien Aptel wrote:
> >>>>> Patch LGTM
> >>>>>
> >>>>> Reviewed-by: Aurelien Aptel <aaptel@suse.com>
> >>>>>
> >>>>> Stefan Metzmacher via samba-technical <
> samba-technical@lists.samba.org>
> >>>>>> This isn't in MS-SMB2 yet.
> >>>>>>
> >>>>>> Is this AES_128?
> >>>>>
> >>>>> This is returned in latest Windows Server Insider builds but it's n=
ot
> >>>>> documented yet.
> >>>>>
> >>>>>
> https://www.microsoft.com/en-us/software-download/windowsinsiderpreviewse=
rver
> >>>>>
> >>>>> I've asked dochelp about it during the SDC plugfest and they gave m=
e
> >>>>> this:
> >>>>>
> >>>>>       The new ContextType is:
> >>>>>       SMB2_SIGNING_CAPABILITIES 0x0008
> >>>>>       The Data field contains a list of signing algorithms.
> >>>>>       =E2=80=A2    It adds a new negotiate context, which enables S=
MB to
> decouple signing algorithms from dialects. E.g. if both client and server
> supports it, a session may use HMAC-SHA256 with SMB 3.1.1.
> >>>>>       =E2=80=A2    It adds the AES-GMAC algorithm.
> >>>>>
> >>>>>       SigningAlgorithmCount (2 bytes): Count of signing algorithms
> >>>>>       SigningAlgorithms (variable): An array of
> SigningAlgorithmCount 16-bit integer IDs specifying the supported signing
> algorithms.
> >>>>>
> >>>>>       The following IDs are assigned:
> >>>>>       0 =3D HMAC-SHA256
> >>>>>       1 =3D AES-CMAC
> >>>>>       2 =3D AES-GMAC
> >>>>>
> >>>>>
> >>>>> I've been CCed in a Microsoft email thread later on and it seems to
> be
> >>>>> unclear why this was missed/wasn't documented. Maybe this is subjec=
t
> to
> >>>>> change so take with a grain of salt.
> >>>>
> >>>> Just curious if you've heard back on this. Insider builds will
> sometimes
> >>>> support things that don't make it to the release. Even Preview docs
> can
> >>>> change. However, AES_GMAC has been on the radar since 2015 (*) so
> >>>> perhaps the time has come!
> >>>>
> >>>> I'd suggest wrapping this context and the integrity algs in some kin=
d
> of
> >>>> conditional, in case this is delayed...
> >>>>
> >>>> Tom.
> >>>>
> >>>> (*) slide 29+
> >>>>
> https://www.snia.org/sites/default/files/SDC15_presentations/smb/GregKram=
er_%20SMB_3-1-1_rev.pdf
> >>>
> >>>
> >>>
> >>> --
> >>> Thanks,
> >>>
> >>> Steve
> >>
> >>
> >>
> >> --
> >> Thanks,
> >>
> >> Steve
> >
> >
>
