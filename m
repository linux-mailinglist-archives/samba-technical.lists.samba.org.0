Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA6B52B1D5
	for <lists+samba-technical@lfdr.de>; Wed, 18 May 2022 07:27:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Kj3fSM9V2bk0iuAuYcDBR8x9zKfPhlL5wHc5TUZLhK8=; b=e8ofcnGcU1VLMICi4/mZb1M3hf
	MMu8Z8TPlMyjogsTkFtBJLIQcnq47/Ljr4ziUktlLFZnU00yNFyF/mUxUlJFrolY/qz/D4OUKVEM2
	uKroTeO1bI8I9yMUmvUIZEtfM2Q+TqdRnBpwticmYsqsGVtnH58mZR+BS5qbUDMEcV4acAofkalUm
	u/dmn0ktsfrfB+wSr5cCadGlzzbvg0Pv5eRC9JPf6ZJE9wnz9zopI9dHkmUJv9HDh+W7V/WZvwoB2
	HB701lwrUqK2Qis5aabAj4QqKtlEIOmlKrpniAT5Oap2jK+DQfIQAqQQYkdLHIlV0qiTnuaceR/ok
	h6MFiuSw==;
Received: from ip6-localhost ([::1]:34660 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nrCCC-001uOV-0q; Wed, 18 May 2022 05:26:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61646) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nrCC7-001uOM-Fb
 for samba-technical@lists.samba.org; Wed, 18 May 2022 05:26:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Kj3fSM9V2bk0iuAuYcDBR8x9zKfPhlL5wHc5TUZLhK8=; b=WAO34RzsP5TAJ7j1Fsu/NGHN69
 xCSAzyfkIG5TxIfzSnVhkL7HeyTpJfzn4pQ6yfIltf0J8/o/msEUoUIVQYPI4BjhOoHYQobv0n0Tj
 ubv0AhR/woNa03SEmvBPqpJXLrfR5fimSTQfj547dMQtstSFYgEfNGfFYknxeeZbcceme3PSbuiv3
 iT3DQSISHu7X1YBzzFk/4ld1Pg8+m/eUNh9+0Ay3XUHUItHpPgVIGwQkpytUkCRzp199vBU2r2SiY
 FwUhdR8+7gNU3/J3K10+u3JyeHe04m3aEWy8V+1C4cYVPMmMnRoctp291JO5+x0ppjTSR+cHymmvu
 JpmrjWuKznE87xhrAWfPdLhqLImKUeaW388Y5t8TxmoVEWSfF8whCDfLAAlV7bLPln/amD83ySSFh
 LpwSOlKto/VmdSMBywHsgyzwEMU/hA8OAeBUcMNVetpCPxsE4KKeOW5vR3rMjtqnpcQ8/+u8QLrY1
 ty/BC3m8hpyZMIB0AjSksvgO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nrCC6-001QPt-6e; Wed, 18 May 2022 05:25:58 +0000
To: Ralph Boehme <slow@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Subject: Re: Can someone try buildar for building our bootstrap CI images?
Date: Wed, 18 May 2022 07:25:57 +0200
Message-ID: <12009659.O9o76ZdvQC@magrathea>
In-Reply-To: <6138f33dd48dce98b7a2f8cc93353db4b55ad6cf.camel@samba.org>
References: <cce05b792f8377095d010cedf715bdefdcc580cf.camel@samba.org>
 <004187c0-a4ee-8457-a1a3-8264efa56dc8@samba.org>
 <6138f33dd48dce98b7a2f8cc93353db4b55ad6cf.camel@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, May 10, 2022 9:06:49 PM CEST Andrew Bartlett via samba-technical 
wrote:
> On Tue, 2022-05-10 at 20:02 +0200, Ralph Boehme wrote:
> > On 5/6/22 04:57, Andrew Bartlett via samba-technical wrote:
> > > I'm more than happy to answer any questions.
> > 
> > afait this shouldn't be needed given podman can be used to build
> > containers in rootless mode and gitlab plans to support podman in
> > the
> > future as pointed out by Andreas, right?
> 
> Well we can't really wait for the future, the need is imminent, unless
> we dedicate our entire GitLab.com quota just to image rebuilds
> (possible, just costly).

I see in the gitlab runner issues that people already use podman 4.x 
successfully.

https://gitlab.com/gitlab-org/gitlab-runner/-/issues/27119

https://gitlab.com/gitlab-org/gitlab-runner/-/issues/28815

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



