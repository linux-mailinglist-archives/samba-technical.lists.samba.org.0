Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D77CF409CAE
	for <lists+samba-technical@lfdr.de>; Mon, 13 Sep 2021 21:08:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=f6/3B+yJtpAzsOXsZ47gGqeeji4aJT+k5Q9QuyNq3Jo=; b=ppGsbyQJcQZMo2fA4DldwvqTVq
	tsaDZQJ89XSP6ZHkc8tGznDbH4eqBtzMm22077d1xAsD1fWhUR7s+nfgC0lqwkXwqfpdvyAYxW/vt
	eVkq1d+dIoa8KuVNhA5pHmnKyOLM0zt+j5nx/jll2XHTZJNSi4DXOfXXAq2HY8OYQs3gvel+LB7kO
	ABQkoHieV09F6c+Wmo3OwYCVSwn6M/WdLMavNT0jvh/PhDs9s88G//5g7Ij8VhnpBV/vkg/Lx2H1M
	U2X7Pdq2bwM90+Xyyj9r7ERhXVhd2g5T304XNLBKDK0K60UnFoUimyNHQJUXrUN69uY+VSxbfFaAJ
	fbjgiHjw==;
Received: from ip6-localhost ([::1]:48824 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mPrJv-00EvzE-95; Mon, 13 Sep 2021 19:08:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26590) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mPrJp-00Evz5-Ch
 for samba-technical@lists.samba.org; Mon, 13 Sep 2021 19:08:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=f6/3B+yJtpAzsOXsZ47gGqeeji4aJT+k5Q9QuyNq3Jo=; b=zsl+YX2lf/gJbJMaubpj/HIYqm
 9IoCWRPP5dYPfCdBJ00eHXwMDzkCBSUPSxy528lheWgw6mMRG4kK48xtcF8X4AJEjBTK9YS2az+tr
 6Ms65f/wWb5WgWU9UkthRheIPqMUkxtcnkPRjdzKo/D72MEmchXvPfLOhiQ4h5yGpMyAUwFs2+0YX
 ie6zm++XLAwbtcJgGT/HlgUJGToj5iEtooXGxMbpLHYop/XbTYVAQcbcapWtCY+Qa5JAh0LTF8EWe
 gCvlCZ7YZvbJJQoOPC/in6V0UEe41JrN1X3uiT6kELn6011MrWVIBsL3CWJ3Iagpncxo5Q6xkA+tG
 kQKfElHH/BqLpQ9jb/TKFS6Lyl28rSVE2Ze5NuvGHubglXWslJO2l7plNATOD66NMHr4IUtHmTId1
 1oRosgxsPbV6jLrzQpB0BCgr1hX/k/a7Tjj9kYsHF/VjxCosZ7kv29L7jZXuOuPM+ib4hBH0uY7gf
 4jJ7Mt6HU8Y5XuV38jihPUiS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mPrJn-0060LA-QA; Mon, 13 Sep 2021 19:08:39 +0000
Subject: Re: Linux kernel LOCK_MAND deprecation
To: Christof Schmitt <cs@samba.org>, Jeremy Allison <jra@samba.org>
References: <ac56564760f592b3a6fe477b8ce0e65a0759c988.camel@samba.org>
 <YT+NIpgJUq6GX54f@jeremy-acer> <20210913181145.GA13476@samba.org>
Message-ID: <246ff815-8964-036a-7911-10d59c4e1ed6@samba.org>
Date: Mon, 13 Sep 2021 21:08:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210913181145.GA13476@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="e9f5wFeJFlBQIq4sumZ8HaKDrgS1be3mr"
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
Cc: Jeff Layton <jlayton@samba.org>, vl@samba.org,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--e9f5wFeJFlBQIq4sumZ8HaKDrgS1be3mr
Content-Type: multipart/mixed; boundary="vZJAdAJQ7MqoyWBYzIpkwahALPriAVe8R";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Christof Schmitt <cs@samba.org>, Jeremy Allison <jra@samba.org>
Cc: Jeff Layton <jlayton@samba.org>, vl@samba.org,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <246ff815-8964-036a-7911-10d59c4e1ed6@samba.org>
Subject: Re: Linux kernel LOCK_MAND deprecation
References: <ac56564760f592b3a6fe477b8ce0e65a0759c988.camel@samba.org>
 <YT+NIpgJUq6GX54f@jeremy-acer> <20210913181145.GA13476@samba.org>
In-Reply-To: <20210913181145.GA13476@samba.org>

--vZJAdAJQ7MqoyWBYzIpkwahALPriAVe8R
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 13.09.21 um 20:11 schrieb Christof Schmitt via samba-technical:
> On Mon, Sep 13, 2021 at 10:40:50AM -0700, Jeremy Allison via samba-tech=
nical wrote:
>> On Mon, Sep 13, 2021 at 10:02:01AM -0400, Jeff Layton via samba-techni=
cal wrote:
>>> I recently proposed a patch to remove most of the support for
>>> flock(..., LOCK_MAND...) from the Linux kernel. The code in question =
has
>>> been broken for well over a decade, such that trying to use LOCK_MAND=

>>> flock locks is really just a no-op:
>>>
>>>     https://lore.kernel.org/linux-fsdevel/20210910201915.95170-1-jlay=
ton@kernel.org/
>>>
>>> Samba references that symbol in kernel_flock(). I started to take a l=
ook
>>> at removing the code from samba, but the work kind of snowballed with=

>>> all of the wrappers and indirection.
>>>
>>> Would anyone who is actively working on samba want to take a stab at
>>> removing kernel_flock()? It should be safe to just rip it out since i=
t
>>> hasn't worked in ages.
>>>
>>> If it's not removed, then you may see kernel warnings on Linux when
>>> samba tries to set a LOCK_MAND lock, a'la:
>>>
>>>    pr_warn_once("Attempt to set a LOCK_MAND lock via flock(2). This s=
upport has been removed and the request ignored.\n");
>>
>> So the only code that sets it is in source3/smbd/open.c:
>>
>> 4048         if (!fsp->fsp_flags.is_pathref &&
>> 4049             fsp_get_io_fd(fsp) !=3D -1 &&
>> 4050             lp_kernel_share_modes(SNUM(conn)))
>> 4051         {
>> 4052                 int ret_flock;
>> 4053                 /*
>> 4054                  * Beware: streams implementing VFS modules may
>> 4055                  * implement streams in a way that fsp will have =
the
>> 4056                  * basefile open in the fsp fd, so lacking a dist=
inct
>> 4057                  * fd for the stream kernel_flock will apply on t=
he
>> 4058                  * basefile which is wrong. The actual check is
>> 4059                  * deferred to the VFS module implementing the
>> 4060                  * kernel_flock call.
>> 4061                  */
>> 4062                 ret_flock =3D SMB_VFS_KERNEL_FLOCK(fsp, share_acc=
ess, access_mask);
>> 4063                 if(ret_flock =3D=3D -1 ){
>> 4064 4065                         del_share_mode(lck, fsp);
>> 4066                         TALLOC_FREE(lck);
>> 4067                         fd_close(fsp);
>> 4068 4069                         return NT_STATUS_SHARING_VIOLATION;
>> 4070                 }
>> 4071 4072                 fsp->fsp_flags.kernel_share_modes_taken =3D =
true;
>> 4073         }
>>
>> and removes it in source3/smbd/close.c:
>>
>> 454         if (fsp->fsp_flags.kernel_share_modes_taken) {
>>   455                 int ret_flock;
>>   456  457                 /*
>>   458                  * A file system sharemode could block the unlin=
k;
>>   459                  * remove filesystem sharemodes first.
>>   460                  */
>>   461                 ret_flock =3D SMB_VFS_KERNEL_FLOCK(fsp, 0, 0);
>>   462                 if (ret_flock =3D=3D -1) {
>>   463                         DBG_INFO("removing kernel flock for %s f=
ailed: %s\n",
>>   464                                   fsp_str_dbg(fsp), strerror(err=
no));
>>   465                 }
>>   466  467                 fsp->fsp_flags.kernel_share_modes_taken =3D=
 false;
>>   468         }
>>
>> (and a couple of other places that do the same thing on close).
>>
>> The rest is just boilerplace VFS glue that allows the VFS call:
>>
>>          int (*kernel_flock_fn)(struct vfs_handle_struct *handle, stru=
ct files_struct *fsp,
>>                                 uint32_t share_access, uint32_t access=
_mask);
>>
>> to be caught by all VFS modules. It's not too hard to rip out
>> for 4.16.x (too late for a VFS change in 4.15.0).
>>
>> The only question I have, is this being used in IBM gpfs at all ?
>=20
> GPFS implements the Samba VFS call and implements sharemodes through a
> private API call to the file system (see vfs_gpfs_kernel_flock).=20

Are you 100% sure? I was also looking at this and wanted to talk about=20
this with the stakeholders.

The reason I'm worried is that in vfs_gpfs_kernel_flock() we both call=20
kernel_flock() kernel functionality and call set_gpfs_sharemode() GPFS AP=
I.

If the GFPS implementation relies on LOCK_MAND being set in fl->fl_type=20
by the kernel function then these changes would break GPFS sharemodes.

Cheers!
-slow

--=20
Ralph Boehme, Samba Team                 https://samba.org/
SerNet Samba Team Lead      https://sernet.de/en/team-samba


--vZJAdAJQ7MqoyWBYzIpkwahALPriAVe8R--

--e9f5wFeJFlBQIq4sumZ8HaKDrgS1be3mr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmE/obYFAwAAAAAACgkQqh6bcSY5nkbK
Dw/+K3Y7wBIV4Cx1l3yHNTByv195MZU9b+J+lB11c/oa7xF1P8puikfdUIS2GKQQ4t7gvleM9JEi
lICje1WzjB/eaZAdng3SC7p/okp1hmoUsXVsSldP6UuSaMReQW/uIkW0WE94Yez+b8i6GeNxXD24
AYOZuvsHYHATpwsDmgnroG9VaCLnjqrxVai7dFbqSTb+pIcAUJbdvTyuwJT3WTu2hfOydzoyhJhZ
OdWRhs/HdA0mQsN7g+wRrZAmhFm5bVIU2LAb93zjcbkVlyQGdJwuVmaIpi/471PicrrxFUmAy/VI
IAjfBXq1vNeEwe5NWi5DJPf13zpXeHBIdXdq2vB1gFM56NIG8HD+QQJ6g8pI3EJXJcnqe7FVLf72
WHTGOcwae8iTngoGBgNwC3CqBqK27U4xKu9fMS1k6cN2VGkZJy3r36/DR9sxOfJeV3hcIPQcvFkU
SQ25pscMnf+6vLr4U8xPZxxSWycgAZ8lIT/bxlrZIAahvy42LjTNkytOor/oUzTjnd6NXhlEq+aH
FELwoRpP6bTbiZsGQ5WIjoFL8RsK9Ax6aY87CihHvFckTGvx2Rp1iT59I/DsUTtTuBcMSYSDnItr
iGvUSj1wbDEpi3mFNxOWli+oE+XyuiNl7S/3PdMlKhJxdWmTP6vk4E4ZJ6t+bD3lfa3rHqVxwqI3
7Xw=
=9WF1
-----END PGP SIGNATURE-----

--e9f5wFeJFlBQIq4sumZ8HaKDrgS1be3mr--

