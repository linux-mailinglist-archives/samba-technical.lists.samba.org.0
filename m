Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C2B3A8D17
	for <lists+samba-technical@lfdr.de>; Wed, 16 Jun 2021 01:57:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=og/ue3m2KmQHf9xWKja7WjhXJC3AHDDN6U9iOXbluE8=; b=oQzQavHvgWMXRRfmS9g0Xdg3dJ
	AiGjyAELEyS53NvBHtUZj4fcW9nwMN+9VOv2es9FSLFNjbB5VXuef7CN4F2jVZkF+Q5UU7bfMP7Zv
	fpjbKOg+Luu5XhQyjjyMhqQ+5TdzPouQvyXR/S1d4r3jlHT18nY9gqjI4ZLwXii1hOP8KJh66/51+
	jo+92jBFS/fzBad/x/KwatwNz1dvjVeayjnoY6/DZWT2By75ZW4IbDSo3NShBCC6O7oh2r8rbjQHL
	1Rvd6YVnNfKSFaKZhVqc6z4Vzd5LLJh3WV9kdN3GacaYESNPi/LqMLptlHDQoXRZF4YrUmTCDUvIo
	ZVYOjDTQ==;
Received: from ip6-localhost ([::1]:22692 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ltIv4-0065AE-KL; Tue, 15 Jun 2021 23:56:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55780) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ltIuz-0065A5-4z
 for samba-technical@lists.samba.org; Tue, 15 Jun 2021 23:56:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=og/ue3m2KmQHf9xWKja7WjhXJC3AHDDN6U9iOXbluE8=; b=xhgMiU8tt8IfHStIAmT3rVvgtS
 MZR5z8GS0FApu/df0wAPseBTZY+vWO22TnN7JfhvG5OCELMlZIsQuwmD5Bf0eg8DUs/ZhYCjrZGgq
 68cHA4phDWANvLIxjDJAD8kDQxyOecmSlzep5O/S6JWLVfXY7H9BZSvCidksQshPPFV8+LQpO24et
 rKa4u7Aq8qS8Wl8P35Oav3i9McIhMWnQyEOiiXadu3f5uMvxrD03nvKUfI3tCkNtdrM16YcHYgELG
 TwB9SBGvMijgX3f1LoTuIXtyjIqBFbBfKDb2mQOd+elgdTF/9oUu8wph9GjovSSFQBBGivW98RJYU
 FxSn2LMBunjvNe0YrRyCPDOlmDo/RTj9tYE811c/415mOhcYjBNFwy2EAEkGvjabpt/mWG2dt2esV
 eHxPh8pBT1n5VPrB4Iy90gpJLsymO1yS4WaP8Y4pIUGTVZ399uJ/z911LCoM0D4/65o5FwBmZ7eF3
 lq5QNacapjCkfNId/MqRsVsB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ltIuw-00064H-V4; Tue, 15 Jun 2021 23:56:27 +0000
Message-ID: <b2cb195314281883e378c908784ac6f9f841584d.camel@samba.org>
Subject: Heimdal upgrade, really happening this time
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Stefan Metzmacher <metze@samba.org>, Isaac Boukris <iboukris@gmail.com>
Date: Wed, 16 Jun 2021 11:56:22 +1200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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

G'Day,

I just wanted to say that Catalyst is finally making a solid run to get
the Heimdal upgrade done, and FAST implemented.

The purpose of this mail is to outline my proposed approach, in case
there are any major issues.

Firstly, I wanted to pass on great thanks to you Metze for your prompt
review of the patches last night.  Where I can, I want to keep 'drip
feeding' the patches in, but that might be as much as I can manage on
the Heimdal side, the rest and pretty firmly tied to the actual
upgrade.

There is still so much to do of course and any assistance you can give
will make things better and safer, but be assured that this time we
(Catalyst) are committed, serious and can pick up and hold up our end
of the task.

On testing, our intention is implement an initial Python test for the
FAST protocol, and enough of the Python testing to allow the C based
krb5.kdc.canon to be stripped back, stopping it modifying the AS-REQ
and allowing us to restore the AS-REQ protection.

In parallel to that, I'm working to get a modern Heimdal building and
passing tests, based on the great work already done.  For the Samba-
tree changes to source4/heimdal in the branch, I'm going to upstream
what changes I can, and push the rest to lorikeet-heimdal so we are not
totally blocked on upstream merge issues.

This will land as a pretty big bang, I don't really know any other way
sadly.

We don't have an infinite budget, quite the opposite really, but if we
are all sensible then I'm confident we can land this by the end of
2021, perhaps even sooner!

I greatly appreciate the work you have done over the years towards
this, without that ongoing effort this just wouldn't be possible.

My current draft is up as a MR, and I'll continue to work to upstream
what I can (into Samba/Heimdal).  I do plan to upgrade Heimdal again
(perhaps to align to a release in 2021 if they make one) before I
finally merge the branch.

https://gitlab.com/samba-team/samba/-/merge_requests/2014

If you have any specific directions, concerns or hints I should follow
please let me know early.

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


