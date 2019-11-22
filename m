Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 582951068B0
	for <lists+samba-technical@lfdr.de>; Fri, 22 Nov 2019 10:14:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=fy431Q4ukCG/lXAUQXy06rCSdOHnr7PxTldzFvpntdc=; b=laBJKU2qw8mC9Dhjijl7JzkLLm
	IM4/UXJiVGMnwuHgbasWGNJco3Z592NiAyGb9bwnbYMQtV+HBtRukqPHJHfwmYoo7/GhnaPJ5oN7J
	majGKoLlXwoqTGSKwLklOvUU2KZ8MI6MqmuFcZRiTXRZzaKOzx9ifv4fVHmqsfHMJppIb89z+On06
	wt+kFbctAk6poRstun68V+ESJc+PLRpbjepoa8W5ivUA+EmeqsjY4cjVTFb9kUv2/NlIf8fUhq0G1
	rFMgKK1YgtKOEY3C37/SpgFtLP815kJUzGhA8XCcanWVGBEOtVhdF1AxazZWBlcfhCxAIAmZV8pkQ
	9LNUw0XQ==;
Received: from localhost ([::1]:48638 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iY50H-0020aJ-JU; Fri, 22 Nov 2019 09:13:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43276) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iY50A-0020aC-QL
 for samba-technical@lists.samba.org; Fri, 22 Nov 2019 09:13:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=fy431Q4ukCG/lXAUQXy06rCSdOHnr7PxTldzFvpntdc=; b=N9+m07VbP2vaIKb3+HdVOXNvV/
 5TuWAx3yYj2VocsUVB7JHNVYFNqwK77UL5otiJBeJFzpaOjhHTgMQfgEKXmlo7RXNcdmkZPAKN/Ob
 xAmKrj/WztlKCsjYwDxO0LoDoY2QFpfWCHPMeGjif9ymTkK3dPQeGwUsvpZR88HItWwfO86Uy4WC9
 UqjkuBDPdkd0QhJ94mx+gI6ZyirLcwIBYzzDY6TmujytSd1Di7RGl3BI3/aTQ4p3zXoPFxUiCm6zf
 jb65oxp4YhiyaXSMSVBe/7oWBOMkdOsD0nL4Pp2YKid1IWMuux/4CE1Fvb9IlN3ibHdPxZnqIXj3H
 EAnF0ol6yT67s5yP59GFqNTF+3JOOpOfEEke/MKYkg6HKCp296H2K9gzXyfHyXO+yfvOKCKSMzyTj
 eNgfF5H5QBQvr/LJ7gYGC5gI3pPfmkGNMYplXMK6aWg0Z7DUDTeKazLWgf23jL9ZcL+tZUETOSISj
 mBdS8VBK76MH5KA27vN/VZ0o;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iY508-0002XD-Ad; Fri, 22 Nov 2019 09:13:17 +0000
Message-ID: <118908fe1f076becc0c7e3c3debf680b444f9bbb.camel@samba.org>
Subject: Re: libpytalloc-util 2.2.0 broke the ABI
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Date: Fri, 22 Nov 2019 22:13:12 +1300
In-Reply-To: <1647506.J1yn77AgSA@magrathea>
References: <1647506.J1yn77AgSA@magrathea>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1 (3.34.1-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2019-11-21 at 14:41 +0100, Andreas Schneider via samba-
technical wrote:
> 
> This has been introduced by commit 24127acae0f05f0011c4008e75f1a1de31584199
> 
>     ABI: Remove unused .py3*.sigs files
>     
>     These are no longer used by the build system so avoid
>     confusion by removing them from the tree.
> 
> I'm investigating how we are fixing this in RHEL now. Maybe we have to add the 
> symbols back in our package.

Ouch.  What I will say is this:  The py3.sigs stuff was a disaster,
Debian tried to make it better (but seemed to make it worse, as far as
I could tell, even minor upgrades failed the debian ABI checker), so I
dropped both the additional patch and then disabled py3 libs from
Samba.  

Debian has of course had py3 re-enabled now, but my disable of the py3
build caused Debian not to be able to ship Python3 bindings for ages.

The Fedora packages had dramas with how much of the python ABI to
embed.

And then this.  I'm kind of glad we accidentally dropped the whole .py3
ABI file, even if we have to clean up this mess.  It has single-
handedly caused much confusion, work and frustration in packaging
Samba. 

> For Samba I guess we should bump the SO version of libpytalloc-util to 3 asap.

And here re-starts our library versioning discussion.  Could we at
lease merge my 'remove ldb independent version logic', so we can bump
the pyldb-util ABI without a whole ldb version bump?

> In addition I think we need a CI job which runs the abi-compliance-checker for 
> all public libraries.
> 
> Fedora provides packages for abi-dumper and abi-compliance-checker. So we 
> could keep an ABI dump from the current released version in the source tree 
> and compare against that one if we break anything.

Yeah, I guess that's a useful idea.  Perhaps extend one of the CI jobs?
(Please don't create a whole new one if possible). 

Andrew Bartlett
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



