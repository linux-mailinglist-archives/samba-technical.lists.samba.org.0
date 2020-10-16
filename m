Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E8A290460
	for <lists+samba-technical@lfdr.de>; Fri, 16 Oct 2020 13:51:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=h+wZ/gvjfEtLbL9737D20/+8jyFvc79rFHzNxP1cZRQ=; b=U+GX0juyER9Kob5v4TjmCAsifc
	vQ0hguxi2DxHqv8JM3UGGOmfV9+s11WTYOj8UcsuKlcWVefIyjKkmzfpLzKiSRuE2W1hfIHVQkM75
	8ReFNlpFNG3K3SmdThS1cxsarEZPVzWKhn+MiH6LUHndpmWqP4UUvLJVpxiaGTZN9voZ/ALJhRfaZ
	4WN/hRs2pJL39sn0YuNEzWVz6NP3q2pNvDxCksY4wBxfTlWVc9XldiDd226A1Hbqf1VXsDsLTOP8i
	ASkF7QW5HlwMXO8RxZg/rYiamIf9HMMjIoCF/HQid7qfjpZ5Bd8XTGldU5l7IJRf9EAMgBYhQg2dl
	a5jVxPew==;
Received: from ip6-localhost ([::1]:40926 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTOFP-00COa0-SO; Fri, 16 Oct 2020 11:50:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53492) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTOFK-00COZt-Od
 for samba-technical@lists.samba.org; Fri, 16 Oct 2020 11:50:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=h+wZ/gvjfEtLbL9737D20/+8jyFvc79rFHzNxP1cZRQ=; b=TZNrIzw0VTm9gsi1AMmUE7veIG
 ZXzYZns/X6lmfGuoGPsNmVkgwOpQwPcUgvSpfw6OrQfu+QwLiWiXxHYpTFMzfTFO0T424l8xE6wqX
 6W3rMYUSY7ZqyA/XxCjMolzDYlQ4bXweFYGfvwErTRchc8gwHmOvRsHoPAmPsP4niWdos5b8LLvJW
 2GxYGPJtWBlEVFuoYgPhlpdzBLnnf5RjLHitoDVfTipgO6GuI9XBwUGfKx8XjCpxtAtx9Cmoz+fV1
 0Wn2Gzmr7lwbozsvtPp9pfDWjF+EP1X89BHSmKQOf1PB2LjZydrHM6NezL0ZQs+UCT6QBv7mNB7EC
 3aQjK3aP2BVNipngx/AUHRzm+SYpoTL8IuNCkdPpUSEM8M50Cq1C5HDoLO3ncXQ9akailMFlkByMP
 cYIryW0IMlRffmcOesEQ4BjhY/D/z5v1Ab8sIiBcVAntEkHE9pKpBtf7yt5blKsYqWLhbFH+o1NCq
 XK5rLdVzkN52j+976Gdip2D6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTOFI-00032J-Tq; Fri, 16 Oct 2020 11:50:05 +0000
To: Jens Axboe <axboe@kernel.dk>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
References: <53d63041-5931-c5f2-2f31-50b5cbe09ec8@samba.org>
 <efb8b619-ca06-5c6b-e052-0c40b64b9904@kernel.dk>
Subject: Re: Samba with multichannel and io_uring
Message-ID: <6e7ea4e7-8ef7-9ad4-1377-08749f9bae0b@samba.org>
Date: Fri, 16 Oct 2020 13:49:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <efb8b619-ca06-5c6b-e052-0c40b64b9904@kernel.dk>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="s7PdufiuUL6MMsXImia5UgmvXF4XBr5UG"
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--s7PdufiuUL6MMsXImia5UgmvXF4XBr5UG
Content-Type: multipart/mixed; boundary="zOLDbm4YKcXCQob8eXdY6zjluLfwTxzBk";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Jens Axboe <axboe@kernel.dk>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
Message-ID: <6e7ea4e7-8ef7-9ad4-1377-08749f9bae0b@samba.org>
Subject: Re: Samba with multichannel and io_uring
References: <53d63041-5931-c5f2-2f31-50b5cbe09ec8@samba.org>
 <efb8b619-ca06-5c6b-e052-0c40b64b9904@kernel.dk>
In-Reply-To: <efb8b619-ca06-5c6b-e052-0c40b64b9904@kernel.dk>

--zOLDbm4YKcXCQob8eXdY6zjluLfwTxzBk
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Jens,

> Thanks for sending this, very interesting! As per this email, I took a
> look at the NUMA bindings. If you can, please try this one-liner below.=

> I'd be interested to know if that removes the fluctuations you're seein=
g
> due to bad locality.
>=20
> Looks like kthread_create_on_node() doesn't actually do anything (at
> least in terms of binding).
>
>=20
> diff --git a/fs/io-wq.c b/fs/io-wq.c
> index 74b84e8562fb..7bebb198b3df 100644
> --- a/fs/io-wq.c
> +++ b/fs/io-wq.c
> @@ -676,6 +676,7 @@ static bool create_io_worker(struct io_wq *wq, stru=
ct io_wqe *wqe, int index)
>  		kfree(worker);
>  		return false;
>  	}
> +	kthread_bind_mask(worker->task, cpumask_of_node(wqe->node));
> =20
>  	raw_spin_lock_irq(&wqe->lock);
>  	hlist_nulls_add_head_rcu(&worker->nulls_node, &wqe->free_list);
>=20

I no longer have access to that system, but I guess it will help, thanks!=


With this:

        worker->task =3D kthread_create_on_node(io_wqe_worker, worker, wq=
e->node,
                                "io_wqe_worker-%d/%d", index, wqe->node);=


I see only "io_wqe_worker-0" and "io_wqe_worker-1" in top, without '/0' o=
r '/1' at the end,
this is because set_task_comm() truncates to 15 characters.

As developer I think 'io_wqe' is really confusing, just from reading I th=
ought it
means "work queue entry", but it's a per numa node worker pool container.=
=2E.
'struct io_wq_node *wqn' would be easier to understand for me...

Would it make sense to give each io_wq a unique identifier and use names =
like this:
(fdinfo of the io_uring fd could also include the io_wq id)

 "io_wq-%u-%u%c", wq->id, wqn->node, index =3D=3D IO_WQ_ACCT_BOUND ? 'B' =
: 'U')

 io_wq-500-M
 io_wq-500-0B
 io_wq-500-0B
 io_wq-500-1B
 io_wq-500-0U
 io_wq-200-M
 io_wq-200-0B
 io_wq-200-0B
 io_wq-200-1B
 io_wq-200-0U

I'm not sure how this interacts with workers moving between bound and unb=
ound
and maybe a worker id might also be useful (or we rely on their pid)

I just found that proc_task_name() handles PF_WQ_WORKER special
and cat /proc/$pid/comm can expose something like:
  kworker/u17:2-btrfs-worker-high

ps and top still truncate, but that can be fixed.

Some workqueues also expose their details under /sys/bus/workqueue/.

I guess there's a lot of potential to optimize the details exposed to the=
 admins
and (userspace) developers.

metze



--zOLDbm4YKcXCQob8eXdY6zjluLfwTxzBk--

--s7PdufiuUL6MMsXImia5UgmvXF4XBr5UG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl+JiOMACgkQDbX1YShp
vVZHHA//aPDpfw1X6zKkgkICujHSFtRqG8/hsxBTNGe3BUsFUikSrSgpVqAKhpYk
iZk4yDeCMQ4DkhtA2ZrhVKx/rAJN/lB1hfpXG/agwbcSjD41TwWp27ocL9bQlQbX
zAlVRq2eRMIsL4kqlDb7iDVsiFb7soB3zdYnCjHHocr89+PpaBfgyVvGcjZQw8xt
gH0MqNwimblLcsmeRhtgi80+QeH6Ygpqw+bqHTVPqhVr8x6LXtsslsITY/vL1dg7
1WdrtXdVA1wnE77NfuQoSI85Z0ybObQPnMG+10ELJk4PvvHThUt86VSShCGxVulk
/H1tg1AU8Ymv0Kknjz1MfR6VobJjX9VnOaBVPizscLx4Xfe3jK9IieoXYbZe2EDh
4iPlKcJSDdOBNskdbm7GzbE1vOW7uQdrGk5aZ8C1tkyYrNWmd0uPK5LtP76IQX09
m7GjFS46ynVqLQLkQysOSD07NeGXDR1vZ42unoNIHd+Hq7nLBxG8w5YGW3rFcMgg
DiI7BF+wQJbKE50TWX86yJPIveFW20pBCMti73uIMYnKtIQlTAcoU1iwf6lNseqd
dG558AgxEEBwKjXYqnlkYzbpfs7R17lDw1atKs9tGDf4j047N8pzfkBVqTxwoQQ9
35KPFm1Ya1KUXprT8k5Rt8PEyQBaTjs9dxCVYeKXngMBnYeFeqk=
=itSY
-----END PGP SIGNATURE-----

--s7PdufiuUL6MMsXImia5UgmvXF4XBr5UG--

