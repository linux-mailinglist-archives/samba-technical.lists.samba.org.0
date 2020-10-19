Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B67292A9B
	for <lists+samba-technical@lfdr.de>; Mon, 19 Oct 2020 17:42:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Zng3WFoYCheeBdBL9sLxNAmiySNWM+/vKqhwiIjYC4Q=; b=v78br4VlRe8ABGuNm9XM8FhdSW
	ffdO2y3wpFZ057PsrdWk3Pp/08/+8Dz+0BMwvcDJm0uUwgTAC9fWmHHc0eq5IOHXTRRrR1F4idqnb
	rz3snobDrZ1n1UCaGjhHX5hOxRvlFC0Xqf+TI/2h1y7sjFYGV/enoRQPLsqoCgU3+P62MyuioZD9W
	veQkFtp2b2Piz8SL2RYS6F0fa3eaf2LwzH9QPWiFbCYX2RTvL9tvqORwa+bLv3Rmy66HIQkQThcnk
	MGG05I1z4BFV/J2cRpZTaycKDxTEb2cj7VuqE4v+6oRagFIQyGvlmrlFJUeGSzW1BJnaCy1z8NMWA
	b0kQDd7A==;
Received: from ip6-localhost ([::1]:55942 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUXIa-00CkHk-R0; Mon, 19 Oct 2020 15:42:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40254) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUXIV-00CkHd-Ot
 for samba-technical@lists.samba.org; Mon, 19 Oct 2020 15:42:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=Zng3WFoYCheeBdBL9sLxNAmiySNWM+/vKqhwiIjYC4Q=; b=Ma007CR7cElUKcUq+d6S56BExJ
 Sq7ijyoAoPfDE54mN4WUrs0u8y1kV+EOIdelyhEN5QgXflIFnJdW4O4VvBhq81wmO/aswztojHyYL
 wlZ/d74ynwg0LRznDNr8A3hDjk1EYAfeY148Hl83UbxOPxMkgo1KWbu5NwhK0ml5VKGDf8ezXH6s7
 KEx+vNXGDwjBtNxdy7mNGef7YrDP23DCoc7nshJZxXSfBq2hC+o4g5d0wk81sCZhSE1j6Rhz5sgVH
 fyloTH/0DJQ/+CGy24aNH40xx/eSjg0nVsh8lnwZUpP4Vb6I/9WxElL69fXD4cvIK9+rTUijLXybt
 CDmPPIFyb+cAXeQ+lQJjjxZIPDLWIwNL3qGRMnpBrTi7IVsKPOWMsQQo2jsse++/RdvAGwrmEBgFl
 uC92xrEJ4M63nltSXxXyDFVnzs3zxff3IIhBT+Xkn+GLwJWeTC8XsqCPfajFsfuxJmKsl6o1hwtED
 6rbruOM/+xqItUQjRKFTlvBy;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUXIV-0005Jr-0c; Mon, 19 Oct 2020 15:42:07 +0000
Date: Mon, 19 Oct 2020 08:42:04 -0700
To: Rowland penny <rpenny@samba.org>
Subject: Re: Clarification around the DCO
Message-ID: <20201019154204.GA504635@jeremy-acer>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82b64ba2-b0bc-d30b-ce97-f2f916b0f10a@samba.org>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Oct 19, 2020 at 10:10:47AM +0100, Rowland penny via samba-technical wrote:
> On 19/10/2020 10:01, Ralph Boehme wrote:
> > Am 10/19/20 um 10:09 AM schrieb Rowland penny via samba-technical:
> > > So, I bunch of Lawyers and the SFC are trying to dictate to Samba just
> > > what is in the DCO and what it should be called. The lawyers are only
> > > kicking up a fuss and dragging Samba into their argument because they
> > > cannot get their way. Is this a much simpler version of what happened ?
> > this seems really harsh and to me it seems James doesn't deserve such a
> > response in any way. He has been carefully expressing why he's
> > approaching us and he is not forcing us in any way.
> > 
> > Thanks!
> > -slow
> > 
> It wasn't really aimed at James, it was just my understanding of what he
> posted and If my understanding is correct, then it was aimed fairly and
> squarely at the bunch of lawyers, sorry for any misunderstanding :-[
> 
> My feeling is that the bunch of lawyers have spat the dummy out AND thrown
> the teddy out of the pram and are lashing out at everybody and anybody to
> get their way, they need to be put back in their box.
> 
> BIG NOTE: All this is just my opinion and must not be taken as the opinion
> of the Samba team.
> 
> a very blunt Lancastrian

FYI, James is also English :-). I'm sure he understands "very blunt Lancastrian"
in the way it was meant.

But IMHO this is now all a storm in a tea-cup.

James asked nicely, I screwed up by not adding the (C) to
our original text plus we've now got a decent enough name you
came up with Rowland that (hopefully) everyone is happy with
on the Samba side.

Let's add the (C), change the name and continue the
discussions on the team-list to see if we can get to
using the "standard" text.

No more "blunt" language needed :-).

