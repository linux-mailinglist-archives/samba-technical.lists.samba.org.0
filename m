Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 081D31EF3D6
	for <lists+samba-technical@lfdr.de>; Fri,  5 Jun 2020 11:15:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=6l/Y9qFsRjZdpL4rs0zKJmQ45etlwNezRnjmGdYWrco=; b=QW5Pl7UOyF1Lf60jF0ndwTKsPR
	WqiuyLG0OtQLxSMV+AM6a2+DFNYvJjsB1D1MdmuvUsVkpUHeBLYKC15lDU9WRyXcpJofgWYbe0Ljn
	xQRqm3FKnrdyiAzxcsIwmWf7+5ti8MifT5Z6LThAXXC+QSBVkFlZKpsJjTP2i9oOh2Qra3EOKKP9s
	IXuLYARPWkoXy6zbHU3gFh0KfywKn21AgAaGDc0pU5CXU1r4pmSc8FrYa+wC1uJBB8oCzmPDPBOkv
	hfO9HaCaxFEI9UOkjgVvV/66qSpRvn2DfcgJsTh/Lgh5YWs5xzBXh/HyYD8kbRoXeGbZBMatskipz
	I610wRBw==;
Received: from localhost ([::1]:49452 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jh8Rq-0095nn-Hl; Fri, 05 Jun 2020 09:15:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16434) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jh8Rj-0095m5-Mb
 for samba-technical@lists.samba.org; Fri, 05 Jun 2020 09:15:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=6l/Y9qFsRjZdpL4rs0zKJmQ45etlwNezRnjmGdYWrco=; b=GLgSInuPvNYUnfOv+7smPFMpcE
 D1fZzfDUtAA8dD7si5JTOx/fiPfJoX5OmM8OhfMZHQggE6wYh5R4cSQt7BWkP7F0AFFANRQUSYUjB
 Yd2pWkOTwSMOWxTQnHzCrwaxfigV+cAaIDjUKS6TXjL8r5kk61YIfNLgnCR/fP/hsy6CVl1gZ7tlL
 S87WM4B1CniW+NXaneFVRfTJbsn38bgtRBJZjhkAd/JNWnsYZnagg6hFNE4LdgM3QywyMEKTQGpDV
 PKmhcpnWoYCAflAyZpBYfpl+h+NfJRmp2zfmm5d/ON9ZpBPTqmRBG8+L4dZPvHy+ULTHy2CW7N+qq
 cdamTNcBwT8nMfn9qqKqOigSrszlCFIb8n3Ip3r/7R9aCXVNvdUf5hQz8vermLUQRcwljifgCal1Z
 JGRlFCHh5IYfWGp5MQJwaf2V5t7GMzHcsOpMfl+bnoJsdReu1bXQ+3mpoH5LQbnClBC7kcpCEkIff
 PThPZYZpUMadcG8nYAZaaWb1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jh8Rh-0004v0-Vt; Fri, 05 Jun 2020 09:15:26 +0000
Message-ID: <d964391f79cd21db4b1c4118ab62909b6ff9717d.camel@samba.org>
Subject: Re: git signoff+ and review+
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Date: Fri, 05 Jun 2020 21:15:22 +1200
In-Reply-To: <3376401.t2CYSfcsgO@magrathea>
References: <2070261.IvKQ8U6GgO@magrathea> <2877725.qJPT1UHR8W@magrathea>
 <c2d4f9132f8a70749d6019acc5b592f32415d652.camel@samba.org>
 <3376401.t2CYSfcsgO@magrathea>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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

On Fri, 2020-06-05 at 09:56 +0200, Andreas Schneider wrote:
> On Friday, 5 June 2020 02:06:56 CEST Andrew Bartlett wrote:
> > G'Day Andreas,
> 
> Hi Andrew,
> 
> > I wondered if we could have an agreed set of aliases included in
> > Samba?
> 
> You cannot include those in the Samba repository. Those are all
> individual. 
> All you can do, is provide a script which could set them up running
> 'git 
> config'.

Do you mean we can't do it technically, or we shouldn't do it because
we are all individual developers with our own way of doing things?

We already do that for the post-commit hooks automatically, so why not
do it for some common git aliases?

I know strong individuality is a strength of the Samba community - and
I wouldn't dare drag a developer away from the editor - but I would
argue that we could also gain by having some common tools for working
with gitlab and reviews for example.

It means we can then document them in our wiki for example, and know
everyone, even new developers, are running the same commands in the
same way.

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




