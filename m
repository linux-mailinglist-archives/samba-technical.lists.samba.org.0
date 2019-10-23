Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 35450E197D
	for <lists+samba-technical@lfdr.de>; Wed, 23 Oct 2019 13:57:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=0AIp4re2jGmquBFpzhIS3SEka1g83eCcwZiyiI8LzG4=; b=bFvS09zx0rpjna6ah7oEZ5pDw/
	aF/IxzbhwZTH41aFiMQ1EB8oFEc+yWdfG41y0zx4kD1S8ZvaG6eHnGGnUx/4o8deeNLJzIqS17NzN
	rU70gwnKEEKRrlZIdXad2Blf7zN3bLCQ7wgcC+7axBQW1w22hgPtHYih12MJp9SkY3lIyFATTwE9e
	Uw+vwh3l2A/cxDsMUOauD9dAvQawz2WvRMtuqZnGPGk0ZKKEHa85KdmE4V1YwsPawWcjsfW1cAJTE
	9IKTX9fh6foNE1Lo6IRaiOMI7F9fJ3U0SHXovNSI/YAeH/Htb5G86EknQci83mH57+L5r1DX6dfqn
	xT9mr4Cw==;
Received: from localhost ([::1]:63052 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iNFGH-001fgs-DS; Wed, 23 Oct 2019 11:57:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44152) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iNFGC-001fgl-MV
 for samba-technical@lists.samba.org; Wed, 23 Oct 2019 11:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=0AIp4re2jGmquBFpzhIS3SEka1g83eCcwZiyiI8LzG4=; b=PSaWWwvBSNei/aE5YqGfgumddw
 WaTDNjtxxKws2opMLUw1j0N9fE4CE5xEqAZHbIHTLfPt8QEBBbvTADk04fOmNHYUC3D1PN7aNvtEj
 vPzNN76xXqWdOhgUEEcMi+/q/Cqn3IhA/WZMYebBea6W/GZRhUnTV5oKpYLxM9jntUKuGbpr3riRc
 3nKu0l0BvnXk4WD3xxuYC283NS227P1/06frhL7QXTmsmz4D3sRxKBgjCbR2aQQni0o7nQgsE78Oo
 eUuvRl1kGx5vvMNs2jNXIOZbdpYLoGH+IFVDjHJK6/N5JhMdOkYV7Gc39RZ7hK2Sx3q6alfVtC9h0
 PqpTGArTd6NCfDp5fNOMBv6iakvHgoSaBgssc9dHt8HOMIvBwG5Im+XK8Tj9snvil5w8+AUbaHIub
 3hHW+wqFqNqxX/KUJcsF3iy2if7DOIHmUC757iTkdepcvltcOUMViwz+iX3h8KRyTNawCr5z8lKOH
 eyvZnzpVxL4WPdrt0lbE9EsH;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iNFGA-0000w1-MM; Wed, 23 Oct 2019 11:57:02 +0000
Subject: Re: Converting SMB1 tests to SMB2
To: npower <npower@samba.org>
References: <f0f71737-cd07-b361-1c26-58116e6e8ed8@suse.com>
 <be6770e5-5bf0-4665-4a88-3e4182e4c82e@samba.org>
 <0981db46-93bf-f153-c98f-15d5cf404353@suse.com>
 <ed7eb92f-46a7-758e-f3b5-185d71b8b98a@samba.org>
 <002434db-63ef-edad-d091-76e3efe783d1@samba.org>
 <15dfbaf6-c774-debe-b61e-c3ef4e7f9727@samba.org>
 <d9625941-c85a-a686-2162-30c80a2e84b3@samba.org>
 <fa464ebe-cfe7-1d6e-7435-c896e2cc188e@samba.org>
 <f479113c-7a74-8259-823e-4ae1c4a713c6@samba.org>
 <47fef5d6-7fb6-b054-a8c5-7a28b63e97c8@samba.org>
Message-ID: <9cc9d402-57fb-3568-29e6-12284d6ccd98@samba.org>
Date: Wed, 23 Oct 2019 13:57:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <47fef5d6-7fb6-b054-a8c5-7a28b63e97c8@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 10/23/19 1:08 PM, Ralph Boehme via samba-technical wrote:
> On 10/23/19 12:38 PM, npower wrote:

>> * I thought that it would not be acceptable to just effectively remove all of these tests without a clean transition path, e.g. they run till they are removed
> 
> All this has to happen in a private branch of course, you can't push the
> initial changes upstream of course.

what would works as well, and I guess this might be what you had in mind, is

* force smb2 in the testenvs

* move all failing tests to seperate temporary testenvs that still allow
smb1

This changeset could the already go upstream, allowing working on the
indivual tests in a more piecemeal fashion, because the resulting work
can be pushed upstream for every test.

Once all tests are taken care of, the temporary test envs can be removed.

This would avoid accumulating all the changes in a private branch and
the rebase hassle that comes with it.

Is this what you had in mind?

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

