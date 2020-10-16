Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E00C6290928
	for <lists+samba-technical@lfdr.de>; Fri, 16 Oct 2020 18:04:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=DOCcCuGMvHBCnQDSLwm+3EuVv0bY8605xW/BHjtuCaU=; b=hMqWAaVcStYT2n+YXE37ryu3++
	qQRFok29Kg4fEjmR6+yccmoBTqulNmEXp7F+4c9m6Ck2eiKfJRQsz6jrLYQAo7r0xc3NHDCTew8ux
	BHYUuJtTvQmM3FeZKQJeofrcQNVRakntyy4Yh+8NyHsZFQKm40i/pmN4bDOi4lD2VDCZDmfzVbb6J
	r+YnleoojYpIntX37zzClMa/GaafnLq/auzuHmx1/FrDgOlBIbZP2f4Fei6xOvhvegMdDPPuMoE9s
	eec2DF0M/zjJJ4Y5YUrt0Z9nLGeIP1z6NzpYOZBxeD+XyfKW4XUJVo0VlZp5SEQeIfHUSOGQ3sFQY
	mqsiNLbQ==;
Received: from ip6-localhost ([::1]:47980 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTSD1-00CPup-Vy; Fri, 16 Oct 2020 16:04:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26002) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTSCw-00CPui-Mc
 for samba-technical@lists.samba.org; Fri, 16 Oct 2020 16:03:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=DOCcCuGMvHBCnQDSLwm+3EuVv0bY8605xW/BHjtuCaU=; b=B5KNvwNIOC/f2J9rkjsQdUJSXG
 Wd27+1y5kf0q5+tWuGpJ661KnJzAwF3zGtCGPnlip6+JwWeSu9TmnJr3xuz2jdU01KweNqVKeUE+6
 MYonplmZeusEbzg2KvCYKtC2w/TRdzEviMFvIZqvqZ6XlBBUfh2r5WjCo7MwDwKUN6wg+Jytxmi7X
 VJJzS8mr/kHTB76UX1mWStMmdkvfyfj87+d4SykJLdOL545Hbh4XTsi6xvik3I8T2bCtdsAlOVVVF
 v1Jz2Vd61g2k8oyEqn3W99+Uo6X8805qeY/Z+01onT9HwLatYPQckIK0IlwZnLsdLXDUIPrUOpKH1
 rrM3dmWSsPWuhnShtVNp7fVyGq1hH2LTQGIuJqiPjvQXZGyakMqGFf6CAYl2FNadbyg6CxMTeuG/+
 XS7zcnL9CCKgtO3huCUV6LUhSrl0Eq1v3affaosXG9iWn15J1kavj2gNx4NHk9u9Ky6LZ1vylmDKk
 BavvYlAwCBu2CKWyCr2AQ2cK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTSCu-0004Tm-CE; Fri, 16 Oct 2020 16:03:52 +0000
To: Jens Axboe <axboe@kernel.dk>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
References: <53d63041-5931-c5f2-2f31-50b5cbe09ec8@samba.org>
 <efb8b619-ca06-5c6b-e052-0c40b64b9904@kernel.dk>
 <6e7ea4e7-8ef7-9ad4-1377-08749f9bae0b@samba.org>
 <18e153db-5ee9-f286-58ae-30065feda737@kernel.dk>
Subject: Re: Samba with multichannel and io_uring
Message-ID: <892e855a-9c4f-ea5b-6728-f02df271c2c8@samba.org>
Date: Fri, 16 Oct 2020 18:03:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <18e153db-5ee9-f286-58ae-30065feda737@kernel.dk>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="ZICZM5CRjaKEEJRcdv54nV3NKqFl3PB4r"
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
--ZICZM5CRjaKEEJRcdv54nV3NKqFl3PB4r
Content-Type: multipart/mixed; boundary="FPtDMhWTWrOGwFQjPZtYRw4LSItBlxwm2";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Jens Axboe <axboe@kernel.dk>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
Message-ID: <892e855a-9c4f-ea5b-6728-f02df271c2c8@samba.org>
Subject: Re: Samba with multichannel and io_uring
References: <53d63041-5931-c5f2-2f31-50b5cbe09ec8@samba.org>
 <efb8b619-ca06-5c6b-e052-0c40b64b9904@kernel.dk>
 <6e7ea4e7-8ef7-9ad4-1377-08749f9bae0b@samba.org>
 <18e153db-5ee9-f286-58ae-30065feda737@kernel.dk>
In-Reply-To: <18e153db-5ee9-f286-58ae-30065feda737@kernel.dk>

--FPtDMhWTWrOGwFQjPZtYRw4LSItBlxwm2
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 16.10.20 um 17:57 schrieb Jens Axboe:
> On 10/16/20 5:49 AM, Stefan Metzmacher wrote:
>> Hi Jens,
>>
>>> Thanks for sending this, very interesting! As per this email, I took =
a
>>> look at the NUMA bindings. If you can, please try this one-liner belo=
w.
>>> I'd be interested to know if that removes the fluctuations you're see=
ing
>>> due to bad locality.
>>>
>>> Looks like kthread_create_on_node() doesn't actually do anything (at
>>> least in terms of binding).
>>>
>>>
>>> diff --git a/fs/io-wq.c b/fs/io-wq.c
>>> index 74b84e8562fb..7bebb198b3df 100644
>>> --- a/fs/io-wq.c
>>> +++ b/fs/io-wq.c
>>> @@ -676,6 +676,7 @@ static bool create_io_worker(struct io_wq *wq, st=
ruct io_wqe *wqe, int index)
>>>  		kfree(worker);
>>>  		return false;
>>>  	}
>>> +	kthread_bind_mask(worker->task, cpumask_of_node(wqe->node));
>>> =20
>>>  	raw_spin_lock_irq(&wqe->lock);
>>>  	hlist_nulls_add_head_rcu(&worker->nulls_node, &wqe->free_list);
>>>
>>
>> I no longer have access to that system, but I guess it will help, than=
ks!
>=20
> I queued up it when I sent it out, and it'll go into stable as well.
> I since verified on NUMA here that it does the right thing, and that
> things weren't affinitized properly before. So pretty confident that it=

> will indeed solve this issue!

Great thanks!

>> With this:
>>
>>         worker->task =3D kthread_create_on_node(io_wqe_worker, worker,=
 wqe->node,
>>                                 "io_wqe_worker-%d/%d", index, wqe->nod=
e);
>>
>> I see only "io_wqe_worker-0" and "io_wqe_worker-1" in top, without '/0=
' or '/1' at the end,
>> this is because set_task_comm() truncates to 15 characters.
>>
>> As developer I think 'io_wqe' is really confusing, just from reading I=
 thought it
>> means "work queue entry", but it's a per numa node worker pool contain=
er...
>> 'struct io_wq_node *wqn' would be easier to understand for me...
>>
>> Would it make sense to give each io_wq a unique identifier and use nam=
es like this:
>> (fdinfo of the io_uring fd could also include the io_wq id)
>>
>>  "io_wq-%u-%u%c", wq->id, wqn->node, index =3D=3D IO_WQ_ACCT_BOUND ? '=
B' : 'U')
>>
>>  io_wq-500-M
>>  io_wq-500-0B
>>  io_wq-500-0B
>>  io_wq-500-1B
>>  io_wq-500-0U
>>  io_wq-200-M
>>  io_wq-200-0B
>>  io_wq-200-0B
>>  io_wq-200-1B
>>  io_wq-200-0U
>>
>> I'm not sure how this interacts with workers moving between bound and =
unbound
>> and maybe a worker id might also be useful (or we rely on their pid)
>=20
> I don't think that's too important, as it's just a snapshot in time. So=

> it'll fluctuate based on the role of the worker.
>=20
>> I just found that proc_task_name() handles PF_WQ_WORKER special
>> and cat /proc/$pid/comm can expose something like:
>>   kworker/u17:2-btrfs-worker-high
>=20
> Yep, that's how they do fancier names. It's been on my agenda for a whi=
le
> to do something about this, I'll try and cook something up for 5.11.

With a function like wq_worker_comm being called by proc_task_name(),
you would capture current IO_WORKER_F_BOUND state and alter the name.

Please CC me on your patches in that direction.

Thanks!
metze




--FPtDMhWTWrOGwFQjPZtYRw4LSItBlxwm2--

--ZICZM5CRjaKEEJRcdv54nV3NKqFl3PB4r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl+JxGMACgkQDbX1YShp
vVb3ew/8CTcmQYCuGPc5PY0RpLIg/pOja5TBSiSQnH+Q1E9Docvo94cvzArXrm/t
vXVheMHqh4ywiROfgGvke21b79nr7G8tFRPdYDFn9GrGtsHb+z/g/L0z2WiWk6aY
bIu2uEYHm9RrffcZ9S2w1VDzhDdMdSgB3wAo9A1M0gW2tO7ntWjwVt7YqBl2vXqn
l2UI6EizZu3CDZtIfdKS37zuvjE7FvIM+ycL1uJ7Z6pjkyoXlrR7Qm9MYv3CT5xc
ZxifyHReOiobFcldT4S1y5pAyV99qbQQ1VwyT5UwJNUfscoWK4TTinji+QmI5/SX
E8YZ48ckypEIu19Er23e4jxeQg2jPJyaX79Rp6tRBDiR7e8EvnfP/Eo2wa7FgVFG
0ACTkUA7WgEAXj2y9gKFqRuKSmt3t0yaZciN5sFHuo9z2Ei9Qk/V+gsPNNYnz8dR
Wb6pQddB5VxLmONbgTZh6ySYU3AGhO/LOj3hYn0LzqyuCshqT8BXg3a6xCyRroHw
Acdcaq4YstiecO85gXngUmDP3ohFjAw9yt/1ZA2trJDvsJ6pCrEOzepIp1HvqeBC
J88SQsFkj2sSFMF5GC/IToCjUv1bWahOIwBkyDJ5PtL7ayUeFyRNsUVa02JEXCA7
U4Hsfs/YOpw0l74hoBbDvugOK5yvT/zQoX4/0fy068p4IIda9rU=
=LWUG
-----END PGP SIGNATURE-----

--ZICZM5CRjaKEEJRcdv54nV3NKqFl3PB4r--

