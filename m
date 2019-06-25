Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B1228564DA
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jun 2019 10:46:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=xEQEe6pBwmRQtaFOpq+ygY1Wus9KZeIsWb9PBQ/TFjk=; b=TOGpdC/wxLt4W/A995vQRX3Pdq
	An8n3yS9O2pPxRJ9cuAZNHwzMTiFKCQc4lUTATNKZ1C+zspZ2Uy0lc8fN0O7voUxuEOukCqEqJjXo
	z38DZdnzQgB3v/QwpqyqVMwh8tMkdyHm3C7l3SeJ58uP594+TALaRjxlQKVuLX0iJEH8Pq2VnZ7yt
	TMDH9Ox2mkAn/YwWLyDWcFQUU8Zbe6rmdW+xXJLoDP/KIkMBdi2m14hwUePC7ljWXpf9k7oDUxHYh
	B8SGxNa4noZxvNYagB/N0siKYbVKZ8J9IZwkVO6kc/AlAZxx4BAZEAygdVHTcTl5/UZUe7NTSyxOR
	qL9bTVYg==;
Received: from localhost ([::1]:50444 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hg3Y5-001qNF-M0; Wed, 26 Jun 2019 08:45:01 +0000
Received: from mx1.redhat.com ([209.132.183.28]:39768) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hfgcs-001ZpL-RS
 for samba-technical@lists.samba.org; Tue, 25 Jun 2019 08:16:29 +0000
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D5019307D932;
 Tue, 25 Jun 2019 07:51:26 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-57.rdu2.redhat.com
 [10.10.120.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC7AF6085B;
 Tue, 25 Jun 2019 07:51:02 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <20190624165012.GH3436@hirez.programming.kicks-ass.net>
References: <20190624165012.GH3436@hirez.programming.kicks-ass.net>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC][PATCH] wake_up_var() memory ordering
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <32378.1561449061.1@warthog.procyon.org.uk>
Date: Tue, 25 Jun 2019 08:51:01 +0100
Message-ID: <32379.1561449061@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 25 Jun 2019 07:51:37 +0000 (UTC)
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:45:00 +0000
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
From: David Howells via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Howells <dhowells@redhat.com>
Cc: Martin Brandenburg <martin@omnibond.com>, linux-cachefs@redhat.com,
 Mike Snitzer <snitzer@redhat.com>, linux-aio@kvack.org,
 David Airlie <airlied@linux.ie>, samba-technical@lists.samba.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
 dhowells@redhat.com, Chris Mason <clm@fb.com>, dm-devel@redhat.com,
 keyrings@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-afs@lists.infradead.org, Alasdair Kergon <agk@redhat.com>,
 Mike Marshall <hubcap@omnibond.com>, linux-cifs@vger.kernel.org,
 rds-devel@oss.oracle.com, Andreas Gruenbacher <agruenba@redhat.com>,
 linux-rdma@vger.kernel.org, James Morris <jmorris@namei.org>,
 cluster-devel@redhat.com, Antti Palosaari <crope@iki.fi>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Paul McKenney <paulmck@linux.vnet.ibm.com>, intel-gfx@lists.freedesktop.org,
 devel@lists.orangefs.org, "Serge E. Hallyn" <serge@hallyn.com>,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>,
 Johan Hedberg <johan.hedberg@gmail.com>, Marcel Holtmann <marcel@holtmann.org>,
 Sean Wang <sean.wang@mediatek.com>, Josef Bacik <josef@toxicpanda.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Sterba <dsterba@suse.com>,
 MauroCarvalho Chehab <mchehab@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Steve French <sfrench@samba.org>, linux-bluetooth@vger.kernel.org,
 linux-security-module@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>,
 Daniel Vetter <daniel@ffwll.ch>, Bob Peterson <rpeterso@redhat.com>,
 linux-media@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
 linux-btrfs@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Peter Zijlstra <peterz@infradead.org> wrote:

> I tried using wake_up_var() today and accidentally noticed that it
> didn't imply an smp_mb() and specifically requires it through
> wake_up_bit() / waitqueue_active().

Thinking about it again, I'm not sure why you need to add the barrier when
wake_up() (which this is a wrapper around) is required to impose a barrier at
the front if there's anything to wake up (ie. the wait queue isn't empty).

If this is insufficient, does it make sense just to have wake_up*() functions
do an unconditional release or full barrier right at the front, rather than it
being conditional on something being woken up?

> @@ -619,9 +614,7 @@ static int dvb_usb_fe_sleep(struct dvb_frontend *fe)
>  err:
>  	if (!adap->suspend_resume_active) {
>  		adap->active_fe = -1;

I'm wondering if there's a missing barrier here.  Should the clear_bit() on
the next line be clear_bit_unlock() or clear_bit_release()?

> -		clear_bit(ADAP_SLEEP, &adap->state_bits);
> -		smp_mb__after_atomic();
> -		wake_up_bit(&adap->state_bits, ADAP_SLEEP);
> +		clear_and_wake_up_bit(ADAP_SLEEP, &adap->state_bits);
>  	}
>  
>  	dev_dbg(&d->udev->dev, "%s: ret=%d\n", __func__, ret);
> diff --git a/fs/afs/fs_probe.c b/fs/afs/fs_probe.c
> index cfe62b154f68..377ee07d5f76 100644
> --- a/fs/afs/fs_probe.c
> +++ b/fs/afs/fs_probe.c
> @@ -18,6 +18,7 @@ static bool afs_fs_probe_done(struct afs_server *server)
>  
>  	wake_up_var(&server->probe_outstanding);
>  	clear_bit_unlock(AFS_SERVER_FL_PROBING, &server->flags);
> +	smp_mb__after_atomic();
>  	wake_up_bit(&server->flags, AFS_SERVER_FL_PROBING);
>  	return true;
>  }

Looking at this and the dvb one, does it make sense to stick the release
semantics of clear_bit_unlock() into clear_and_wake_up_bit()?

Also, should clear_bit_unlock() be renamed to clear_bit_release() (and
similarly test_and_set_bit_lock() -> test_and_set_bit_acquire()) if we seem to
be trying to standardise on that terminology.

David

