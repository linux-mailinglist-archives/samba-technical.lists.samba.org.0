Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF155886D4
	for <lists+samba-technical@lfdr.de>; Wed,  3 Aug 2022 07:40:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ur8yS6+TWe0TMV+PuQGqJWqnthLGUnwvuGH8KpEmvRY=; b=rkk3JVe79VVPQhq4rm8SWUmGXl
	+/6u6QlAgGk6vBFeKtqju8z19Szh9iXG71DPk+4e9YIdum0GJZ0PZHVCoDB/scTC7yUXh92EsIYeJ
	AeyA8FPRSjBv+N5uhFRNr1XVCEO8sgnBSyzcX9a+9sJmpuySgEJqbAwHgEZXg1EJXnePttRdNM1Uh
	pjzipYJtlx6hubd9EVqVvNoYhF9MsCeUajWMf9MPIQ/FvurWIY0ZzBNJLnG65VC3HqXcKLq6J7VQf
	b9gXnP1cfsO2nkyg9G7n9Cqtx3hRbJnJ/OrX6raWw5HgfzEXTDutYFQ3kHFm60UxMhdxwIQb5Mwbu
	u52Xz0ag==;
Received: from ip6-localhost ([::1]:57800 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oJ762-0057fi-UB; Wed, 03 Aug 2022 05:39:06 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b]:40520) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oJ75w-0057fZ-Ad
 for samba-technical@lists.samba.org; Wed, 03 Aug 2022 05:39:03 +0000
Received: by mail-ua1-x92b.google.com with SMTP id r12so6608426uaf.7
 for <samba-technical@lists.samba.org>; Tue, 02 Aug 2022 22:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ur8yS6+TWe0TMV+PuQGqJWqnthLGUnwvuGH8KpEmvRY=;
 b=mmaOzmEDUGrAZQP1Kfn7C7n23dzrEjrSEKquFIcsu5wu2J4a1SNAhPJ2noQAQC+qAn
 tXmnldA38IfXGJvOLrczIEgtRMutaWdRdM/Q3kmnoOE4Vp0qRG9kEefSCY6ttkZDa/ze
 /ZCKOc5rlexsQo371y6WnMHPprUnx7t4+tfjNiTzJe+f1zi4Bizew50kdeY2gf9PQBoh
 s7ckiFjJ26DIibH5x7xi/ElX11SnMt+1zdhT1F4G58Kh7P5nF2gzOttm/7QYTVCNOusb
 BC9O2RzDlNxyFOhkteMhZn2ntI3xZBLMfk+Ld9b564dPvnlNal4Hkkl4h2Jpjv8SPecw
 jHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ur8yS6+TWe0TMV+PuQGqJWqnthLGUnwvuGH8KpEmvRY=;
 b=t2ZjNTOnsl9makbIQk1ZCUCrC/p4rU+KMsCiGPcDMFt+3ByTnnKS2eiXLya4jJV13g
 UhEWdiBgdREpKbgJQBzJALbZg5S5l8U2RAZs9n+z4uflNAyy6bhB/AToThhluMBuAJxQ
 zm98ZX8mfDk35r/X9umX1j5TvqoDUqlkSWzzh3mDHWaYScqbjy+B6XC36gIGK0LIXvBl
 rhtPLcUVCpWGcj8lE0AwFbM3EUGfeRHNEDLu14zt+/u34l6m/u1ZjM/eXDMnE/ctHdrR
 y6GLfu7yWapNi2TCCdSMNxOJYwPAiNGP9/FT79SDVncL0vR31xP33/yL7m87NMrD1mz1
 Skyg==
X-Gm-Message-State: ACgBeo2TpqVBQER69lb29tj758iNltTkadRaKaRVa/CvHfs7Wx3VE98V
 CuTZEUDw1bJkHp3xjLtUqTUeIxqDcRK7TsNdrDY=
X-Google-Smtp-Source: AA6agR73lM3/EP3ZZOPX6NAMi/klqc8sqT34+G4YQjOuC8AkLlB2p1gslc5VEujlyIkK+As5QqA+qEivW724gb063Wg=
X-Received: by 2002:a05:6130:10b:b0:37f:a52:99fd with SMTP id
 h11-20020a056130010b00b0037f0a5299fdmr9111079uag.96.1659505137662; Tue, 02
 Aug 2022 22:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220801190933.27197-1-ematsumiya@suse.de>
 <c05f4fc668fa97e737758ab03030d7170c0edbd9.camel@kernel.org>
 <20220802193620.dyvt5qiszm2pobsr@cyberdelia>
 <6f3479265b446d180d71832fd0c12650b908ebe2.camel@kernel.org>
 <1c2e8880-3efe-b55d-ee50-87d57efc3130@talpey.com>
In-Reply-To: <1c2e8880-3efe-b55d-ee50-87d57efc3130@talpey.com>
Date: Wed, 3 Aug 2022 00:38:46 -0500
Message-ID: <CAH2r5mtWn85=RknxfE2p=Zo24H2ynin2ReLV1jijSG-yLN9J4w@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] Rename "cifs" module to "smbfs"
To: Tom Talpey <tom@talpey.com>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Shyam Prasad N <nspmangalore@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
 Enzo Matsumiya <ematsumiya@suse.de>,
 samba-technical <samba-technical@lists.samba.org>, Paulo Alcantara <pc@cjr.nz>,
 Jeff Layton <jlayton@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Pavel Shilovsky <pshilovsky@samba.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Aug 2, 2022 at 8:32 PM Tom Talpey <tom@talpey.com> wrote:
>
> On 8/2/2022 4:07 PM, Jeff Layton wrote:
> > On Tue, 2022-08-02 at 16:36 -0300, Enzo Matsumiya wrote:
> >> On 08/02, Jeff Layton wrote:
> >>> On Mon, 2022-08-01 at 16:09 -0300, Enzo Matsumiya wrote:
> >>>> Hi,
> >>>>
> >>>> As part of the ongoing effort to remove the "cifs" nomenclature from the
> >>>> Linux SMB client, I'm proposing the rename of the module to "smbfs".
> >>>>
> >>>> As it's widely known, CIFS is associated to SMB1.0, which, in turn, is
> >>>> associated with the security issues it presented in the past. Using
> >>>> "SMBFS" makes clear what's the protocol in use for outsiders, but also
> >>>> unties it from any particular protocol version. It also fits in the
> >>>> already existing "fs/smbfs_common" and "fs/ksmbd" naming scheme.
> >>>>
> >>>> This short patch series only changes directory names and includes/ifdefs in
> >>>> headers and source code, and updates docs to reflect the rename. Other
> >>>> than that, no source code/functionality is modified (WIP though).
> >>>>
> >>>> Patch 1/3: effectively changes the module name to "smbfs" and create a
> >>>>       "cifs" module alias to maintain compatibility (a warning
> >>>>       should be added to indicate the complete removal/isolation of
> >>>>       CIFS/SMB1.0 code).
> >>>> Patch 2/3: rename the source-code directory to align with the new module
> >>>>       name
> >>>> Patch 3/3: update documentation references to "fs/cifs" or "cifs.ko" or
> >>>>       "cifs module" to use the new name
> >>>>
> >>>> Enzo Matsumiya (3):
> >>>>    cifs: change module name to "smbfs.ko"
> >>>>    smbfs: rename directory "fs/cifs" -> "fs/smbfs"
> >>>>    smbfs: update doc references
> >>>> ...
> >>>
> >>> Why do this? My inclination is to say NAK here.
> >>>
> >>> This seems like a lot of change for not a lot of benefit. Renaming the
> >>> directory like this pretty much guarantees that backporting patches
> >>> after this change to kernels that existed before it will be very
> >>> difficult.
> >>
> >> Hi Jeff, yes that's a big concern that I've discussed internally with my
> >> team as well, since we'll also suffer from those future backports.
> >>
> >> But, as stated in the commit message, and from what I gathered from
> >> Steve, it has been an ongoing wish to have the "cifs" name no longer
> >> associated with a module handling SMB2.0 and SMB3.0, as the name brings
> >> back old bad memories for several users.
> >>
> >> There really is no functional benefit for this change, and I have no
> >> argument against that.
> >>
> >
> > If the concern is "branding" then I don't see how this really helps.
> > Very few users interact with the kernel modules directly.
> >
> > FWIW, I just called "modprobe smb3" on my workstation and got this:
> >
> > [ 1223.581583] Key type cifs.spnego registered
> > [ 1223.582523] Key type cifs.idmap registered
> > [ 1230.411422] Key type cifs.idmap unregistered
> > [ 1230.412542] Key type cifs.spnego unregistered
> >
> > Are you going to rename the keyrings too? That will have implications
> > for userland helper programs like cifs.upcall. There's also
> > /proc/fs/cifs/*.
> >
> > These are a "stable interfaces" that you can't just rename at will. If
> > you want to change these interfaces then you need to do a formal
> > deprecation announcement, and probably a period with /proc/fs/smbfs and
> > /proc/fs/cifs coexisting.
> >
> > There are also a ton of printk's and such that have "CIFS" in them that
> > will need to be changed.
> >
> > These costs do not seem worth the perceived benefit to me. You could
> > probably hide a lot of what users see by just renaming (or symlinking)
> > mount.cifs to mount.smb3.
> >
> > I think if you guys are serious about this, you should probably start
> > somewhere else besides renaming the directory and module. This is going
> > to impact developers (and people who make their living doing backports)
> > far more than it will users.
>
> The initial goal is to modularize the SMB1 code, so it can be completely
> removed from a running system. The extensive refactoring logically leads
> to this directory renaming, but renaming is basically a side effect.
>
> Stamping out the four-letter word C-I-F-S is a secondary goal. At this
> point, the industry has stopped using it. You make a good point that
> it's still visible outside the kernel source though.
>
> It makes good sense to do the refactoring in place, at first. Splitting
> the {smb1,cifs}*.[ch] files will be more complex, but maybe easier to
> review and merge, without folding in a new directory tree and git rm/mv.
> Either way, there will be at least two modules, maybe three if we split
> out generic subroutines.

Yes, Tom's points make sense.  The initial goal is to modularize the
smb1 (cifs) code,
and first goal is to do the refactoring in place without creating a
new directory
tree, allowing more and more of the smb1 code to be split out (currently
we can save about 10% on the module size when built with legacy disabled, but
I suspect that it will be about double that as more smb1 code is moved into
ifdefs or the smb1 specific c files).


-- 
Thanks,

Steve

