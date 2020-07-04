Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA6F21479B
	for <lists+samba-technical@lfdr.de>; Sat,  4 Jul 2020 19:03:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=1Rik4PyxhlK8Jf632ZgOxuSSmCKWLA0W3GkrS8NGXIs=; b=X4FdNoNBeFlPTOJOXEa32bbT8V
	LqqqdwAFEhuFchs0ELZrzMelUunf5BIRC3LOfV+JAkI+xs3O8+jK6SOk4Rje1vvAIDUfGFEjCeQaB
	YWA3/JWhVxxnktMLjmaZ9ttY14FFJJny5qriSQk6uoimvsD6VGDqeeApzHLWgTm3xLz6T1BgucwNU
	nMFGLSheIadLhzVpXAWJnnpSi5ju2EtMCW1R8jgtKO1YZ8e3OwwEDOvQc/JhoamS/AI2ttr4nguSQ
	bvpRJ2vGbujN33ekaAHW9PkYWg19Zs/udneB/SxpBDaLyxWHDqVcndXdtQV04RZHUCbczcD3QYiwo
	PEyw73Kw==;
Received: from localhost ([::1]:53522 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jrlYl-005Udz-0Y; Sat, 04 Jul 2020 17:02:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32630) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jrlYd-005Udr-Nw
 for samba-technical@lists.samba.org; Sat, 04 Jul 2020 17:02:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=1Rik4PyxhlK8Jf632ZgOxuSSmCKWLA0W3GkrS8NGXIs=; b=kykUuvfnnWZzLX+mi8SUXl9C0L
 5wLHaW4ozKXqfd1JJcnLSFi0ZrJCJuokAfVM3Jl4jFB2OBas6pDmcjdRh4fCn1t5SBIxSeKloxOKH
 S1G5Hq56I1kRKIs+YdlerbTdrLTDVH/Vgvh04+R5Wi/urGyoTnljRh8GhUrOPpOTNb+CxEY4noROF
 FIrU6fbNSjCZnuiGnHdy9t9h93fCHLqZymxAJ94/6CKydNbus9HqH/tKG4XK3RT4Eh6q6pOcB0iNU
 gumzfCVdDabHzEeAmDZ9rcb6GLBDVPvHkba0qFGXq0IYuYSotdJIcHSseWmnkJNChRhvM7OTRytZN
 GToZ0urtic213R/8G05pmfsv+VzHuM7lNB258GHh29c2gHSQNo9x7fZQnwo0HuqOUXMu+4lu8jKdU
 2ICYZejav9jPRdKKawmb8xImHN17cp48jxri4dp0e7BFxLS1eT8bo/0SdgZlt8JmfyO6FNujkYB8Y
 ps4CQpDzh+YSHazZqzTecRip;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jrlYc-0004YU-6g; Sat, 04 Jul 2020 17:02:30 +0000
Date: Sat, 4 Jul 2020 20:02:27 +0300
To: hezekiah maina <hezekiahmaina3@gmail.com>
Subject: Re: GSoC Update and Phase One Feedback
Message-ID: <20200704170227.GA866108@pinega.vda.li>
References: <CAH72RCUABcQkZ3yyWzATYi0ZeUTsLGGi90Kbk7ySAY6Z-BZSJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH72RCUABcQkZ3yyWzATYi0ZeUTsLGGi90Kbk7ySAY6Z-BZSJg@mail.gmail.com>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical@lists.samba.org, David Disseldorp <ddiss@samba.org>,
 "abartlet@samba.org" <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Hezekiah,

On la, 04 heinä 2020, hezekiah maina via samba-technical wrote:
> Hi mentors,
> 
> I'm glad to have successfully completed phase one of the GSoC. I'm really
> grateful for the support and help you have provided during that time.
> 
> I wanted to give you feedback regarding the concerns raised in the just
> concluded phase one review and an update on building the packages for
> various distributions.
> 
> On writing a blog post on the work already done, I was thinking about
> writing it at the end of phase two as the project would be more mature than
> it's current state with some tests and build packages for the different
> distributions.
> 
> About my experience working with samba-tool, I hadn't had many problems
> working with it but to create a new user you have two options: create and
> add. There were some discussions on the mailing list about this and I think
> the verdict was to proceed with one and depreciate the other.

Yes, eventually one interface would be kept going forward. We keep
backward compatibility for quite some time for options, though. For
samaba-tool, I guess, making more consistent user interface would be
preferred but with Python it is relatively easy to keep compatibility
for 'older' interfaces.

> Another issue I encountered was using samba-tool dns in which you have to
> pass in your administrator password for the realm interactively on the
> console or as a flag. With other commands this was not a requirement and
> i'm not sure why it is required with dns management.

That might be a bug. Please file a bug at bugzilla.samba.org with examples
of an inconsistency and let's work together on fixing it. This would be
a good chance for your to submit a fix to Samba code base!

> Other than those two things the documentation for the sub-commands is
> wonderful and has really good examples.
> 
> I have decided to work with the Open Build Service, from the recommendation
> made by Alexander, to build the packages for various distributions. I was
> making the assumption that the most popular distributions used with Samba
> AD DC are RPM and Debian based. I'm seeking the community's feedback so as
> not to make the wrong assumptions on this.
> I created an account with the build.opensuse.org and have been exploring
> the UI and going through the documentation for OBS. I also created a
> Webhook in Gitlab to push the code to build.opensuse.org when there is a
> commit in the master branch. Is this the right way to do it or is there
> another option?

This sounds great -- we can start with RPMs as the spec file is already
there from the Cockpit starter kit and it works, so it should be
possible to instruct OBS to build RPM packages already. For Debian
packages, I'll look tomorrow for an example (Cockpit is available for
Debian, so we shouldn't have a problem to find an example for external
plugin package build).

> I also wanted to work on a better UI with some of the commands e.g showing
> the computer AD object. The current way for listing the results uses an
> alert group which isn't scrollable and can be a limitation when working
> with small screen sizes. I feel a better way to do it is to use a modal in
> which they appear on a list as they would on the console and make it
> scrollable if they don't fit on the current screen. There was also a
> suggestion from David on having to submit form input using the enter key
> and I will also work on it.

Looks like a good idea. May be file separate issues for these
improvements in the Gitlab's project and add your thoughts on UX/UI
changes as comments to each issue there. This way you can track the
thought process and allow others to comment on the proposals.

In Samba case we haven't been exposed to graphical design experience for
at least last decade or so. We had a graphical (Web) UI to configure
Samba in past but it was removed as nobody was really able to maintain
it and it was more or less 1:1 smb.conf options mapping rather than
something that follows use case needs.

In past few years David Mulder worked on the YaST UI for Samba AD DC
tools but I don't think that design work has left design decisions
artifacts -- I haven't looked in detail though. This is one part that I
find extremely useful to experience and knowing thinking of UX/UI
designers may change your views on usability too (I have been
collaborating on some aspects Nokia Maemo UX design during Nokia N900
and Nokia N9 times a decade ago when the whole UX for mobile was
relatively new and we had a lot of iterations and oscillations between
'too complex' and 'too dumb').

Having these ideas and research on UX improvements recorded as a part
GSoC work would be invaluable.

In Cockpit case, UI changes are typically discussed with design mockup
screenshots in the pull request or issue comments. We don't need to
follow those directly but I find useful some of their practices as they
allow to understand how decisions were made for UX/UI changes.

One of recent examples is this issue: https://github.com/cockpit-project/cockpit/issues/14196
More examples can be found here:
https://github.com/cockpit-project/cockpit/issues?q=is%3Aissue+is%3Aopen+label%3Aneedsdesign

-- 
/ Alexander Bokovoy

