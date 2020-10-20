Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1A0294580
	for <lists+samba-technical@lfdr.de>; Wed, 21 Oct 2020 01:45:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=SX3dEf+OrdUOwvFIRLQdc7Al34tuTyJsvL76PQnrKY8=; b=hv+K+0WvJ0gVe74YMle9+W8P8C
	pVgtwWUmAZ/IDoobLb6B+YDU0V9ZJcias0AkOBycL1ml0FJh2hEYrxRQeqc846uP5wZHSbrYb+tPn
	uD0wfIO9h2TYsyrie3G89O9VdQC5x6r6xWz1LJ4kEFzz5TQE/k1dMwmP9IBi+Wt6nxc/PH8HR/xZ5
	xvFuvgDf0YP2avDfbZ10FQasz5LOpqb5eBNNWA1+F/A7iKUQlHC/YsxebxKwcGNZKpovilb9mkvdR
	Q7nY/trvOzCLO0Z3Un3Hv6/0RVaR064AGDaeL/K9HOhFsSXg7RMT9l/ekftmtUSemUDIMrNO2xLq/
	jDoJoHfw==;
Received: from ip6-localhost ([::1]:47614 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kV1Ih-00Czsq-NQ; Tue, 20 Oct 2020 23:44:19 +0000
Received: from pine.sfconservancy.org ([162.242.171.33]:60612) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kV1Id-00Czsj-7c
 for samba-technical@lists.samba.org; Tue, 20 Oct 2020 23:44:17 +0000
Received: from localhost (unknown [216.161.86.19])
 (Authenticated sender: bkuhn)
 by pine.sfconservancy.org (Postfix) with ESMTPSA id 30803E2C6;
 Tue, 20 Oct 2020 23:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sfconservancy.org;
 s=pine; t=1603237451;
 bh=ZKwt0u9O8d6AcE7ZprWWIozuJAUjIAaAtIn3VRdOIeE=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=aLhp1aX9PA7GlJo//7z3KmNtsas+uCgCggyyeMFRmhRGJ8zQwseMjbekCfYN5lT+I
 qkfJ0NdF5oc0ild1Uuw+tPI8IOBtwnFgMerA5YoP/Py4shwlMTdq8hX+BR2cs6IPR/
 ZC3NOCNAbZb3Sr8PLrrqbiiu36/vZjYsT6CHMPa2aW2Gxwxyfil/94RdD+dP1rStwo
 KpJN2zMcR4uwJ3BAk5fCzBNvbHhvWslF/rXEFCRlFM+EMCTausLBe/24q/jvdO38zt
 67SzwaRiW6FcO1TJm8EJ6sGn6mp8b715d3Q2bENkgM9sOKJpE88w8xjuDSBMnQgPST
 frrzQP45PSqFg==
To: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Subject: Re: Clarification around the DCO
Organization: Software Freedom Conservancy
References: <a4f34abf8b943b01e0f982e21fe1518009fcc556.camel@HansenPartnership.com>
 <20201017004357.GA360279@jeremy-acer>
 <20201017005611.GB360279@jeremy-acer>
 <20201017023840.GA344206@ebb.org>
 <5e8a6736aafa2e4a593af2ee79451cc62a283818.camel@HansenPartnership.com>
 <2b13b0dee1ce4ef9b21825ee38feeca8855747dc.camel@samba.org>
 <daeb61f4f70d3e1a2c7f9b111e3ba3c2e247371a.camel@HansenPartnership.com>
 <d1d94535-fd9f-e76c-0d5e-3ce454d12f73@samba.org>
 <2207cfb3-b1c3-ac2f-289f-02340c755a47@samba.org>
 <82b64ba2-b0bc-d30b-ce97-f2f916b0f10a@samba.org>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAABGdBTUEAALGPC/xhBQAAABVQ
 TFRFAAAAWjotvpiH/PHt27Sj7sq8lXFeBchlBgAAAAFiS0dEAIgFHUgAAAAJcEhZcwAACxMAAAsT
 AQCanBgAAAAHdElNRQfiCx4VFw6omMmeAAACAklEQVQ4y43UPZPbIBAGYGdu0puzQ51bI+qMdXId
 r0F1RoLrwfb+/5+QF307VVR4PDxiF14h7Xa7t3q8LJGjavj7a1euCYiZnaPnv9DF4FyMLKdXOPs4
 XM7KKzzKaF83gem+hUuF8QYUg7Fb4LEQAK1OG3hu4bbC3LpUC87+B9AMfQOg0yv0owEOK4x1+gnu
 M3yaV3jOMGxvKoXEKC9gAoabJtZYlXO8wJcb1hMHQClZgSj7cbzsY4a2vSqltIlz8nMpZnMkEmVw
 N4DtcYJo3AMPXFIMRMax/BjhOxZi2CpKKpWSZCd4C8aZ4CpzjR+Cint9WEp5H12IbbySEpHdaYVh
 OY9onf0Qq9//zDCFEW0MbFjUz7mHD1UdO4B3iErk9whdKdWVRuW5YLl5KnU2rjTBDyPmQImm5mec
 WQx7X3fBNwAzQ9kvBTKR0BwR3Bewhisn2mpkhea3BZwBcdorRlQk9QKecyZukRPeHTmuEL1FdjlJ
 tmTlvoAJPnRaMnKinNICn4QthNaKlNAlLae9sc5UODaelVh+l345u7ZMIY89GNdmWV8cIaTFlLGm
 QKLrzQykh/Aw02WsdoE2l1g7JIPdyWGFL6Hy1uJZsEjavLUXkVyeIdrbpPoXQHxDG0l68wEoW8vG
 BLI6qc2XoUEWCUI26aQfK1wypuwV7v6mtMhtgL8avOP/pBCiigAAAABJRU5ErkJggg==
Date: Tue, 20 Oct 2020 16:40:11 -0700
In-Reply-To: <82b64ba2-b0bc-d30b-ce97-f2f916b0f10a@samba.org> (Rowland penny
 via samba-technical's message of "Mon, 19 Oct 2020 10:10:47 +0100")
Message-ID: <87eels79gk.fsf@ebb.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
From: "Bradley M. Kuhn via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "Bradley M. Kuhn" <bkuhn@sfconservancy.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Rowland penny via samba-technical wrote at 01:09 (PDT) on Monday:
> [A] bunch of Lawyers and the SFC are trying to dictate to Samba just what
> is in the DCO and what it should be called. The lawyers are only kicking
> up a fuss and dragging Samba into their argument because they cannot get
> their way. Is this a much simpler version of what happened ?

No, I don't think so.

Just to give the relevant backstory:

Conservancy helped Samba write the contributor representation you have, and,
as Samba is *part* of Conservancy, Conservancy's legal counsel advised about
it.  Conservancy's paramount goal (as always) is to just help our projects
do what they want to do, which is how we got the existing text.

While there was a recent thread on a CHR-governed list that brought all this
up again, James' summary of that conversation mischaracterized Conservancy's
actions.  I don't see how anyone can summarize that particular discussion
accurately without violating CHR, so I won't even try to do so.

Nevertheless, I don't think it matters much if Samba gets an accurate
summary (CHR-compliant or otherwise) of that particular thread, as James
gave his current complaints on this list already.  We still don't know what,
if any, Linux Foundation (LF)'s complaints are.  But that doesn't matter so
much; we all do our best to be responsive when any complaints are raised.

Fortunately, I can give a complete backstory, as the primary relevant facts
weren't recent, but many years ago and aren't under CHR.  In 2011, Jeremy
took the DCO from the Linux tree, and we made the modifications that are
right for Samba.  At the time, we all thought that the DCO text was under
GPL as there was no additional licensing information provided in the Linux
tree other than GPL (see Git history on Documentation/SubmittingPatches in
the Linux tree for confirmation).  It was totally reasonable for Jeremy to
conclude that the text was entirely GPL'd with no additional restrictions,
and Conservancy helped Jeremy make the original Samba DCO under GPL.

In 2013, Luis Rodriguez (of the Linux project) attempted to make DCO into
its own stand-alone project, which led to many discussions about what the
license of the DCO actually was.  When Conservancy learned of Luis' efforts,
Conservancy did due diligence and reached out contemporaneously to LF to
discuss Samba's DCO.  After initial discussions, LF never followed up
despite repeated inquiries.  LF never made a request for Samba to do
something different.  Around that time, however, the LF republished (without
fanfare) the Linux DCO text with *yet another* license (yielding three
possible different licensings of the Linux DCO in the wild).

I stand by our and Jeremy's conclusion that the existing contributor
representation is right for Samba's unique situation, but IMO we should
limit the attack vector for detractors of Samba's (IMO excellent) practices.
I also don't think it matters what name we call it, and, as I said earlier
in this thread, if changing the name makes *anyone* happy who isn't happy
right now, why not just do it?

> If it was left to myself, I would make any required changes (adding the
> CC-by-SA)

This was definitely the =E2=80=9Cnice thing to do=E2=80=9D, especially sinc=
e CC-BY-SA
required the changes from MR 1610 (now merged as of c15c40e0183) for proper
compliance with CC-BY-SA.  I don't think it behooves Samba to rely on Linus'
licensing of DCO under GPL, which is why I proposed MR 1610.

> In my opinion, it is our DCO (or whatever you want to call it) and it has
> nothing to do with any external body.

Agreed, although keep in mind Conservancy isn't an external body; it's the
organizational home of the Samba project.  Samba is part of Conservancy, in
an organizational sense.
--=20
Bradley M. Kuhn - he/him
Policy Fellow & Hacker-in-Residence at Software Freedom Conservancy
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Become a Conservancy Supporter today: https://sfconservancy.org/supporter

