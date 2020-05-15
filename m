Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 244D81D4258
	for <lists+samba-technical@lfdr.de>; Fri, 15 May 2020 02:48:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=chzaGccfwFRcKlr7/FjjIP7+qiO6Y2eSHRRz+2RrWyw=; b=x+a50lqau5T9Q6yWNUNl+f3vf3
	TANU3C5dHgvhuOXW8UMhX2ARuwksQvSYOcJrHNkJRdVrR87wwuylm2QLOx3KTFo4B+9iLqRzPLaCG
	AevaDr//8J8RNIhMoMaFoqWolVss/5tP/BzojFKuvn5SWYSeiElBkIAFo5BuObjlI0KLvolnymgcU
	AD3EhRkzQxESlDOYjjK3p0HkvO/YLSnghAEDb5EI4OC0xnXIx2l2OrR5imV2aUhi9c5VMgN8QcVKm
	R1QoyI9ilGqvS+TlTJnf/l0zKu2HNKHZaABvbkqP9Igrvol4bSiH9cWOWTtTFY7lTzdtpvKX//ZKO
	3ZMecVSQ==;
Received: from localhost ([::1]:46106 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jZOVa-004Oh5-LL; Fri, 15 May 2020 00:47:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60776) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jZOVT-004Ogx-Dx
 for samba-technical@lists.samba.org; Fri, 15 May 2020 00:47:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=chzaGccfwFRcKlr7/FjjIP7+qiO6Y2eSHRRz+2RrWyw=; b=D23Ovyz9vHEeyQ4W3tNNKy7Z3H
 p3yvxyhmrtNLtLFVPg5Tp1jIP+adn43kmrGmme9f5CgQdPi0b6fnADlPvGG/3odlMtI0MJJvL9KAH
 kFcSwDQ/xHksEQeE2Y3tkBzLCQZzH/s55VqMhfWmUEu0ioGF2i9EJehqENA4669k/iChtQqAtX1P7
 YVRQStqx8K6Di7Qvyb1s9LX3PUqZrkrKFTmtVn5dvxxLOVjvS4pZBtiJfCK9523AMjWsahxVQwDm7
 C+DPLaIb6ER64TlHHwe5JsJZBwGgmTKRVbatksYrH48mqGQCgROVCbc1ioGbmtaJN09VLuxHTrnSq
 RCo+ofcDqHCr527K40FUOzPAvyyBpJPuijvroOXEvZBqpP/Y3oHpefFeQgElxO41T6csEMHshqI+4
 98uaKVMto7gGuesBM4xqjZkF1phVMD7NOjWAsUdzloF/SfzGd5mAhlLi/yNQdY2Um2sux0KoIvC1r
 VfTD1K71PN4Gjb1cgf+E54s9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jZOVS-0008Fn-94; Fri, 15 May 2020 00:47:18 +0000
Date: Thu, 14 May 2020 17:47:12 -0700
To: Michael Adam <obnox@samba.org>
Subject: Re: Behaviour mismatch between "store dos attributes" and "map
 archive" from man smb.conf(5)
Message-ID: <20200515004712.GA30423@jeremy-acer>
References: <e0d86c0fb92046e0f201cc14a112701ca891196a.camel@cryptolab.net>
 <20200513184233.GB9585@jeremy-acer>
 <20200513221431.GA7185@samba.org>
 <20200513225131.GG9585@jeremy-acer>
 <20200513233612.GB7185@samba.org>
 <20200514005508.GA21149@jeremy-acer>
 <20200514075904.GA150211@samba.org>
 <20200514174533.GC13942@jeremy-acer>
 <20200514232614.GA483587@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200514232614.GA483587@samba.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Anoop C S <anoopcs@cryptolab.net>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, May 15, 2020 at 01:26:14AM +0200, Michael Adam wrote:
> 
> If I disable acl_xattr but set "inherit acls = yes", this still
> fails the same way. Only acl_xattr sets the execute perms.
> So at least it is not "inherit acls" alone.

You'll probably have to add extra DEBUG statements
to see what is happening step by step.

> At this point I'm mostly trying to understand.
> I still have the impression that the behavior is somewhat
> inconsistent and random.

Yes. It isn't to a spec and there's no comprehensive
test. Adding such things would be good.

> And it seems to me that the test was not written to pass against
> exactly the configuration of the tmp share in the test env, with
> the awareness that it fails against other standard configurations.
> I can't help the impression that this is somewhat accidential.

Yep.

> That is apparently only true for creating new files.  For opening
> existing files however, the desired access mode seems to have a
> lot to with the ACL on the file. So this is strangely asymmetric:

No, that's only to do with what you're allowed after
the existing ACL is read and compared with what you're
asking or in access_mask.

> (1) We create a file requesting SEC_FILE_EXECUTE.
>     The file gets created without any execut perms.
>     (without acl_xattr and with map archive = no)
>     The create call succees.
> 
> (2) Later open of the existing file also requesting
>     SEC_FILE_EXECUTE fails.
> 
> If I do acl_xattr or map archive = yes though, then #1 also
> creates execute bits on the file. And #2 succeeds.

Yes, but that's nothing to do with what you're asking for.
That's to do with the config settings - not "requesting
SEC_FILE_EXECUTE". I think :-).

