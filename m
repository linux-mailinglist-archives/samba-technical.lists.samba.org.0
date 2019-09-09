Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 80002AD57A
	for <lists+samba-technical@lfdr.de>; Mon,  9 Sep 2019 11:14:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=p/+VTO+MNUYhaXpzt1S3E5puXWvJTlaqVUO1p69RJME=; b=kv3lJ7z/rs8jqQsJW/7y+IH5hf
	mZFRImIKG7fpi5vlQnfaGDA+YkJuH6WIJZYUtxjquVQ9e2ktkZw1/7i3GK0mKtOgZ/DyYtouQj4iw
	+ivfyQ6nCx9FAfCK4SigE+JOv4WOvr9+HQ41d4xmyf+2nnMGfq0NyviA1tG20xWitgzeNxtuVcI1V
	/rGbHrYYtCJYF1+CaNnSnbaYOa7xjYL/JtySds9z86+c44mwc9aOGpPlvndljcmtCYMqss/0nnNd6
	fK2LegITE/W75EPJpyiIlu91KX7Gg8PeY0grfbf4F+JUc80FPMY879XcJNAPZHVJC6Z0JOaalCez9
	fG6KFppg==;
Received: from localhost ([::1]:20268 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i7Fkf-004OXG-Pk; Mon, 09 Sep 2019 09:14:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55664) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i7FkQ-004OTM-J9; Mon, 09 Sep 2019 09:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=p/+VTO+MNUYhaXpzt1S3E5puXWvJTlaqVUO1p69RJME=; b=HhGg6wXpy+8Ky3mVCCoyAkliib
 qkoNaIJ7aUrEr6Y3At8q5Z/2ThW0VqohMDSEtmQtGJhimKRCPXKno7Pzni4NaKOU2dgrhzRnh7utD
 b/e2IGDAbh4kgf6q/V25Ou45W3UTCZSNkcnj++4v1ovpjO1NYBwoAvVLRu/F5AAfLh0E=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i7FkP-0001pw-3K; Mon, 09 Sep 2019 09:14:10 +0000
Message-ID: <eb83e780be6aa729a409203cf98e6918d32d5049.camel@samba.org>
Subject: Samba 4.4 AD DC and GET_ANC restriction from Samba 4.5 DC joining
 (was: Re: [Samba] Error join samba 4.10.7 to samba 4.4.5)
To: Trenta sis <trenta.sis@gmail.com>, samba <samba@lists.samba.org>
Date: Mon, 09 Sep 2019 21:14:02 +1200
In-Reply-To: <CANTbh_9hUpgDkLeBwx8ebKx43cnvA55q8UU409sSLDxbw9mOvA@mail.gmail.com>
References: <CANTbh_9hUpgDkLeBwx8ebKx43cnvA55q8UU409sSLDxbw9mOvA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2019-09-09 at 10:33 +0200, Trenta sis via samba wrote:
> Hi,
> 
> After reading wiki documentation about join I have tested to join a
> second dc, but with problems.
> 
> I need to add a second controller to our AD, and then upgrade existing
> server (4.4.5)  and I have tried to join a new DC 4.10.7 to 4.4.5
> server but I receive join errors, attached output  wit and without
> debug:
> I have executed samba-tool dbcheck --cross-ncs all seems OK
> 
> I have made a test upgrading actual 4.4.5 to 4.10.7 and then join
> 4.10.7 to update DC to 4.10.7 and then works, bu first I need to add a
> second controller to ensure no downtime.
> 
> some questions:
> 1) Why I receive this error?
> Replicating critical objects from the base DN of the domain
> Partition[DC=DOMAIN-TEST,DC=com] objects[98/98] linked_values[762/0]
> Missing parent while attempting to apply records: No parent with GUID
> cdee5b31-365
> 
> d-4c8f-9368-4115b6307a19 found for object remotely known as CN=Domain
> Users,OU=Gru
> 
> ps,DC=DOMAIN-TEST,DC=com
> Failed to commit objects: WERR_DS_DRA_MISSING_PARENT
> 
> --> not sure if can be related with this issue:
> https://bugzilla.samba.org/show_bug.cgi?id=13274

Not that issue, but a very well known one.

The trouble is, Samba 4.4 was happy to get a tree like this:


 X
| |
Y Z

in an order like this:

Step 1

Y

Step 2

Y Z

Step 3
 X
| |
Y Z

As long as everything worked out in the end, it was fine.  But this had
issues, so we patched it to instead demand the objects in tree order
(GET_ANC), but of course the server needs to know what that means. 

Samba 4.5 was, from memory, the first release we did that, but the
server, even with 4.4, didn't really know what that flag meant.  

It wasn't until much later, Samba 4.6 or so, when we finally got the
flag right, which of course gives problems upgrading from Samba 4.4.
(We would sort the current 'page' of replication entries, but not the
whole partition).

We have continued to improve this code since, but that is the core. 
The next issue is a flag called GET_TGT but that hurts much less often,
as we have a client-side workaround detecting that the server didn't
understand us. 

The workaround for you is to carefully touch each object such that the
children are modified after the parents.  Or upgrade in-place that DC
and replicate from there.  Both suck, I know. 

> 2) About join in wiki appears
> "
> If the other DCs are Samba DCs and were provisioned with
> --use-rfc2307, you Should add --option='idmap_ldb:use rfc2307 = yes'
> to the join command
> "
> 
> But checking my command userv to migrate from samba nt doamin to our
> actual ADDC domain this command was not used, but checking smb.conf
> appears this:
>  idmap_ldb:use rfc2307 = yes
> 
> But I'm not sure if I have to use --option='idmap_ldb:use rfc2307 =
> yes' on join command

Probably.  But that isn't the big deal at this point. 

I hope this helps a little.  We need to extend our wiki to explain this
more I'm sure.

I've CC'ed samba-technical for those there who might want to learn the
history a bit more.

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



