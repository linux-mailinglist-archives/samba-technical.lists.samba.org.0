Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCEC7BEC56
	for <lists+samba-technical@lfdr.de>; Mon,  9 Oct 2023 23:07:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=mUNAdLNNN9MbPqKwl8hMXd3VGYXjBSvTX5s62sZrjj8=; b=oRipsATWsLV9SijMOZmdOvvSzq
	JFmHeY2eJtROljwE7o0yCCN5u9l14kgkQMk/+E1weW7DMkjS56ve0EW3AjXMkiHBqULi0xValgLhw
	nHl+QM3l8HyUNn+SCymXQHCqPQsRUIrTFBYdBUgXuoPFJx58zmGQ0F4rJYQt1Io+SxYW2/UTMW7rX
	Jg3VQf8GHo6A3NPusqEe83qR/eFuaKbnqsd5nvhjcwFQErNkBSO9FwX43jIV0C5EqTAHOHrnH+5vA
	is0kUHM91VmPf1ARz45K8pfSZlZ9e069WSwk79HvTcU6vwSrBN6STwW0S2GucT49j2XknQe8ZRnLi
	+JejWraA==;
Received: from ip6-localhost ([::1]:45674 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qpxSt-000jnX-Pp; Mon, 09 Oct 2023 21:06:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53722) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qpxSp-000jnO-7p
 for samba-technical@lists.samba.org; Mon, 09 Oct 2023 21:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=mUNAdLNNN9MbPqKwl8hMXd3VGYXjBSvTX5s62sZrjj8=; b=XZ9kHg4ieV7OFNkXc2TBECEzro
 Mjk75VCqlu9EX6785k3Xx4k7g9G8bVInhwJXq/CEcOjh+mY8P7gJwJ3aK9cFBHf0rCtxCwWtNrpGQ
 v5QgIs/nMPTh42uxJEumzKxwkk91rTMkVmjN1+DqR3Mm6M6zs2bxMqdTy6xXJTguO7y0RQWacD0Fd
 b4FQPy/0+PQqk5VbAvjnSaHiretgtMWfPWLqqRbBCgM5jTSud3c+UyHHzfLV5x7uKTZ2/V+AeyyLH
 2GBB3QqyLhqmzMOLmhcEW9GY+VsSBCKcVAPjKEGz3vAFzOcAOiu1lbIdIt397xyrnnxnp0bY1sXL3
 iVqPbnPdtozBeN4Nujx0763UkSt/DVddilgxdIymfzKuipxjJhIxxLDORJsxGqc2yIAyK2+PU6qjV
 SHSZZytZ6cSNVsLPNbGMbm+yB0N2u3v70n4kfVr3c7hjZhm3Y0lKDpszNirtyWTG6D8IA7vYYH07e
 0SjOqN2wwahRFyxUx0gGUs+Q;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qpxSn-00HXDv-0U; Mon, 09 Oct 2023 21:06:53 +0000
Message-ID: <5ea8fad91f0e02e4851c2c73216b50abb031714e.camel@samba.org>
Subject: Re: Plans on MSA/gMSA support
To: =?UTF-8?Q?=D0=A7=D1=83=D0=B4=D0=BE=D0=B2_=D0=98=D0=B3=D0=BE=D1=80?=
 =?UTF-8?Q?=D1=8C_?=
 =?UTF-8?Q?=D0=98=D0=B3=D0=BE=D1=80=D0=B5=D0=B2=D0=B8=D1=87?=
 <ICHudov@inno.tech>, "samba-technical@lists.samba.org"
 <samba-technical@lists.samba.org>
Date: Tue, 10 Oct 2023 10:06:48 +1300
In-Reply-To: <b1a2c6f144b048cbb630469e8c4c0f7c@inno.tech>
References: <b1a2c6f144b048cbb630469e8c4c0f7c@inno.tech>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Mon, 2023-10-09 at 13:40 +0000, Чудов Игорь Игоревич via samba-
technical wrote:
> Hi all!
> 
> Are there any plans on gMSA support in Samba? I wish I could help
> with implementation or testing.
> 
> --
> With best regards, Igor Chudov.

Thanks for checking in.  I'm very pleased to say this is on Catalyst's
funded roadmap.  We plan to start on this in the next couple of
months. 

It won't be delivered for Samba 4.20, but things going well will be
finished for testing early next year.

We think we have this under control and don't expect to need help on
this one.  

Community collaboration is an important feature of free and open source
development, but as with the other item we are already in train on, I
think real-user test and feedback on the user experience is the best
way to help on that.

You are also most welcome to give us feedback on the merge requests
when they are submitted. 

Rather than getting deeply involved in this particular project, it
would make more sense to, as you have been already done, to make small
improvements to other areas of the DC that you need.  Hopefully you can get some review on the efforts so far and build on that over time. 

This will allow your team to upskill at their own pace, which will be
less frustrating.  Samba is hard!

Andrew Bartlett


-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead                https://catalyst.net.nz/services/samba
Catalyst.Net Ltd

Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company

Samba Development and Support: https://catalyst.net.nz/services/samba

Catalyst IT - Expert Open Source Solutions




