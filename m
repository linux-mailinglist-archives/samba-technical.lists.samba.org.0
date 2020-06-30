Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 505EB21003D
	for <lists+samba-technical@lfdr.de>; Wed,  1 Jul 2020 00:54:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:Date:To;
	bh=Sve4dlQ9vTs07MqbfRNrJl6+PiVwH7p0lf0kupQP+ls=; b=C8+wa7c+2CcBrlbANR3BGwlhZ2
	4T6ISY4ruv5PTRIfVzBVOlz+zQT5mXecrwiUO2MOARbwlKk0XuplqCMi3VHmEgM5hPIlEKpWDYHlQ
	08CeFpyOydMnll7swFyb4llg0BteqRqQm2n8XGrGvmBx7CSFSQnmoxm5A2o0QXffND3BsKi6bR5u8
	9UiauGeNNE8JwSF7KpA7GVhJZe7zAiakrY1DKPlzancNvMJ1FOFPuGB37RizdsGNOGuMNXV8Kgthm
	23ICIm1hkPX0WrsMsjnBQh/5IDUQ2uWjvUjcCpJ+wJAtdXHH1I/2S7ClO99wjTEmTbA3nhvQ2HJDm
	zBcLJYyQ==;
Received: from localhost ([::1]:37966 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jqP8R-002rsl-Hy; Tue, 30 Jun 2020 22:53:51 +0000
Received: from mx2.suse.de ([195.135.220.15]:34940) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jqP8L-002rsH-QV
 for samba-technical@lists.samba.org; Tue, 30 Jun 2020 22:53:48 +0000
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3A0D9ADCC;
 Tue, 30 Jun 2020 22:34:37 +0000 (UTC)
To: yangerkun <yangerkun@huawei.com>, sfrench@samba.org, jlayton@kernel.org,
 neilb@suse.com
Date: Wed, 01 Jul 2020 08:34:26 +1000
Subject: Re: [PATCH] cifs: remove the retry in cifs_poxis_lock_set
In-Reply-To: <62b291ab-291c-339f-e8e8-ba7b0c4f6670@huawei.com>
References: <20200624071053.993784-1-yangerkun@huawei.com>
 <62b291ab-291c-339f-e8e8-ba7b0c4f6670@huawei.com>
Message-ID: <878sg42nf1.fsf@notabene.neil.brown.name>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
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
From: NeilBrown via samba-technical <samba-technical@lists.samba.org>
Reply-To: NeilBrown <neilb@suse.de>
Cc: linux-fsdevel@vger.kernel.org, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30 2020, yangerkun wrote:

> Ping...
>
> =E5=9C=A8 2020/6/24 15:10, yangerkun =E5=86=99=E9=81=93:
>> The caller of cifs_posix_lock_set will do retry(like
>> fcntl_setlk64->do_lock_file_wait) if we will wait for any file_lock.
>> So the retry in cifs_poxis_lock_set seems duplicated, remove it to
>> make a cleanup.

If cifs_posix_try_lock() returns FILE_LOCK_DEFERRED (which it might
after your patch), then cifs_setlk() will check the return value:

		if (!rc || rc < 0)
			return rc;

These tests will fail (as FILE_LOCK_DEFERRED is 1) and so it will
continue on as though the lock was granted.

So I think your patch is wrong.
However I think your goal is correct.  cifs shouldn't be waiting.
No other filesystem waits when it gets FILE_LOCK_DEFERRED.

So maybe try to fix up your patch.

Thanks,
NeilBrown


>>=20
>> Signed-off-by: yangerkun <yangerkun@huawei.com>
>> ---
>>   fs/cifs/file.c | 8 --------
>>   1 file changed, 8 deletions(-)
>>=20
>> diff --git a/fs/cifs/file.c b/fs/cifs/file.c
>> index 9b0f8f33f832..2c9c24b1805d 100644
>> --- a/fs/cifs/file.c
>> +++ b/fs/cifs/file.c
>> @@ -1162,7 +1162,6 @@ cifs_posix_lock_set(struct file *file, struct file=
_lock *flock)
>>   	if ((flock->fl_flags & FL_POSIX) =3D=3D 0)
>>   		return rc;
>>=20=20=20
>> -try_again:
>>   	cifs_down_write(&cinode->lock_sem);
>>   	if (!cinode->can_cache_brlcks) {
>>   		up_write(&cinode->lock_sem);
>> @@ -1171,13 +1170,6 @@ cifs_posix_lock_set(struct file *file, struct fil=
e_lock *flock)
>>=20=20=20
>>   	rc =3D posix_lock_file(file, flock, NULL);
>>   	up_write(&cinode->lock_sem);
>> -	if (rc =3D=3D FILE_LOCK_DEFERRED) {
>> -		rc =3D wait_event_interruptible(flock->fl_wait,
>> -					list_empty(&flock->fl_blocked_member));
>> -		if (!rc)
>> -			goto try_again;
>> -		locks_delete_block(flock);
>> -	}
>>   	return rc;
>>   }
>>=20=20=20
>>=20

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAl77vfQACgkQOeye3VZi
gbmW6BAAinormSTgvP6Zq9Oi/lClg/VGdOBbdsnmyqFgfkx35BKsa0lpdohWdpNB
e9u5TXSgohn1xEvZkYtCa5/bEx/LF4cJYoRnu1zQXS/CHAk22FsynyrbY1o3rAIm
i/9FtbtF02HCSI5j85rqFmDR+6iju9oOZUPMAcb+w3IsxpNXd+HSa8zCXSLUi9aJ
s1orhwmadyFulnDc/hkoD9YS9scZ00W6KKUDi2efXvbmRznH+z4mDVDjevQ9GRJG
7eUBX/GlThAUpFlp1yI8/Pya+5gVpLox3Ttp484FT9M+V/e5LhPB62T+5L5ZbH5y
NIpWWJAFmq9q/OWV9b6UiWyeMQ9S8/ZI5Ll4D6XtGjkYB3MdkOxXUOOg3qxheHQa
pQEmJNOEATiF7zLOC7eSxpKl2aajZAQf1XVkNyJLCePppk655T4enJhKjyR6BoYQ
xNnyUm7SKYx85Lkb19GqQBabJjzkzTdSUui+1VjwqlUYBYsaDOAm8IPu76J+r5qn
FZ0Y6INOhbInI+GH6nOWMAPIK6yZG8/nnJNaFKNR95EnTnmZzWY4zg9pZ4IifQ1J
qrn5SrRfd98TUIN8Xquua8FVCUqUSVUXyJRSA91IJbmrdOw5wnajlOJJ9q8Dl9dk
BgfmAl/EWz40uNaMFkO7Z/BZqVxWDC0rHYEAl8zAi7Oqm0Ci7Xk=
=wuds
-----END PGP SIGNATURE-----
--=-=-=--

