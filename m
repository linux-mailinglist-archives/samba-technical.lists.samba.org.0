Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4069D31A0BC
	for <lists+samba-technical@lfdr.de>; Fri, 12 Feb 2021 15:38:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=fTM1Yvb8ccqrqz5QfZJbZPP5XM+teZsKH95YiPmHvIY=; b=5jeLbFgDsyvLZwCFrABG7wPhTK
	r39p6dQ1mCRfxyQd8nq0KQ8ijq1yV+gwQ2xZKEAFCuL9JuwQg5xnxY48AsNv+po8uehZ8fK4opBlZ
	wOqSi2td+V1YgUjg0xIDR6KPLAIQzxgNG6o9X4pE7eoxWfjGF5Peq/C7THQELu56gIXsfaCBewSKU
	yn0ANIsfmhJD2RE/Un+65BhhmbR8Q8L1eOTM/OG56uq7ZMFsBW17tsseKurBeFnejuujJCGVeqRWV
	BquJFNzNGo1SbXa+GqusoMy3xzajj+NQl9Thp3cfHgtY8W3r8H4+/3V4aIOaP74+nWQ96/BoXaYTr
	TTpNh2PA==;
Received: from ip6-localhost ([::1]:34388 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lAZaJ-00CPVY-C3; Fri, 12 Feb 2021 14:38:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31158) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lAZaE-00CPVR-1j
 for samba-technical@lists.samba.org; Fri, 12 Feb 2021 14:38:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=fTM1Yvb8ccqrqz5QfZJbZPP5XM+teZsKH95YiPmHvIY=; b=pkm751Qs/SsAbVZuxK7M/crjTv
 81Ym68GJmYjH+eLrxtj/7e+g7wke42KS5UhRliY97CBAkaHPzlvChAZXYInYiQi9eCwil7R0KSVp8
 /XM8WveCp89QFM3cJlh6YuHtjud37Vx4adoELzi+Z01/RnoWUnb/m04AV7SAWTSr01XcIBcfls6ch
 GRbtbJ3NB2bit6nIC3Fi1KKpLGcvp+wuRfcEVpdVhDR2mQgEF0N6BSVQfo/bBPvNkb4wInwjfuUGE
 ECARXBnqJQ45frq9w7qiWGsOEOBBxopn3OsC0Ouk/ZoCYPqBfRJMHYy18y4ik2iz331lKaHR1Nnbk
 T7oWsbrztiFupxR1SuUworOrCeCMqm3MWDoKFemQX1fXfqHSTDfnG/Mp2QWFeZ8ZNzxJ7j9mLLH9C
 8bM9YqvDmDR7yNZBYjEDgC7wG7ziBU8hsG37pAsfSCZgbxIL/ax1+25reYYKKCz0FvujW8AqXI9E4
 TBklTV9qosAlppzUn7FQGSce;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lAZaC-0001W9-5a; Fri, 12 Feb 2021 14:38:08 +0000
To: Namjae Jeon <linkinjeon@kernel.org>, Namjae Jeon
 <namjae.jeon@samsung.com>, linux-cifsd-devel@lists.sourceforge.net,
 Samba Technical <samba-technical@lists.samba.org>,
 Linux API Mailing List <linux-api@vger.kernel.org>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>
Subject: RFC: ksmbd ABI for ksmbd-tools...
Message-ID: <adf41e69-5915-06aa-6f8b-8ffc073fc8a7@samba.org>
Date: Fri, 12 Feb 2021 15:38:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="FeP9e8KaBxtJxEsZr2idMziV53Ac65aQ6"
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
--FeP9e8KaBxtJxEsZr2idMziV53Ac65aQ6
Content-Type: multipart/mixed; boundary="wVOrAfdOXbKc7vYfpYHEAlgTFTeRydQYk";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Namjae Jeon <linkinjeon@kernel.org>, Namjae Jeon
 <namjae.jeon@samsung.com>, linux-cifsd-devel@lists.sourceforge.net,
 Samba Technical <samba-technical@lists.samba.org>,
 Linux API Mailing List <linux-api@vger.kernel.org>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>
Message-ID: <adf41e69-5915-06aa-6f8b-8ffc073fc8a7@samba.org>
Subject: RFC: ksmbd ABI for ksmbd-tools...

--wVOrAfdOXbKc7vYfpYHEAlgTFTeRydQYk
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Namjae,

I looked through the interfaces used between userspace (ksmbd.mountd and =
ksmbd.control)
and the kernel module.

After loading the ksmbd.ko module and calling 'ksmbd.mountd', I see
the following related proceses/kernel-threads:

  12200 ?        I      0:00 [kworker/0:0-ksmbd-io]
  12247 ?        Ss     0:00 ksmbd.mountd
  12248 ?        S      0:00 ksmbd.mountd
  12249 ?        S      0:00 [ksmbd-lo]
  12250 ?        S      0:00 [ksmbd-enp0s3]
  12251 ?        S      0:00 [ksmbd-enp0s8]
  12252 ?        S      0:00 [ksmbd-enp0s9]
  12253 ?        S      0:00 [ksmbd-enp0s10]
  12254 ?        I<     0:00 [ksmbd-smb_direc]
  12255 ?        S      0:00 [ksmbd:38794]
  12257 ?        S      0:00 [ksmbd:51579]

I haven't found the exact place, but ksmbd.mountd starts the kernel-part.=


ksmbd.mountd also acts as some kind of upcall, for the server part,
that takes care of authentication and some basic DCERPC calls.

I'm wondering why there are two separate ways to kill the running server,=

'killall ksmbd.mountd' for the userspace part and
'ksmbd.control -s' (which is just a wrapper for
'echo -n "hard" > /sys/class/ksmbd-control/kill_server') to shutdown the =
server part.

As it's not useful to run any of these two components on its own,
so I'm wondering why there's no stronger relationship.

As naive admin I'd assume that the kernel part would detect the exit of k=
smbd.mountd
and shutdown itself.

It would also be great to bind to specific ip addresses instead of device=
s
and allow to run more than one instance of ksmbd.mountd (with different c=
onfig files
and or within containers). That's why I think single global hardcoded pat=
h like
'/sys/class/ksmbd-control/kill_server' should be avoided, something like:=

'/sys/class/ksmbd-control/<pid-of-ksmbd.mountd>/kill_server' would be bet=
ter
(if it's needed at all).

I also have ideas how ksmbd{.ok,.mountd} could make use of Samba's winbin=
dd (or authentication)
and Samba's rpc services, but this would require a few changes in the net=
link protocol
between ksmbd.ko and ksmbd.mountd. It would be great if a Samba smb.conf =
option could
cause smbd to start ksmbd.mountd in the background and delegate all raw S=
MB handling
to the kernel.

So my main big question is how stable would the userspace interface to ks=
mbd.ko be
treated?

Would it be possible to change the netlink protocol or /sys/class/* behav=
ior in future
in order to improve things?

Can we require that the userspace tool matches the kernel version for a w=
hile?

I think iproute2 creates a version for each stable kernel tree and tools =
like
bpftool, perf even come with each single kernel release.

While others like 'cifs.upcall' try to work with any kernel version.

What do others think?

metze


--wVOrAfdOXbKc7vYfpYHEAlgTFTeRydQYk--

--FeP9e8KaBxtJxEsZr2idMziV53Ac65aQ6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAmAmksgACgkQDbX1YShp
vVaIHRAAserhJWOmXPNIZtsk4PGY7POA3fnXr861G7Uv0Dk7dgmpuu9CiN2wlwtQ
Y9Swc1FsMeoYNnSnKZk/ShZ/s/taOJejqmq2ItDR5Ev+A7r5yVP3ThFa+hcQkWks
V1XI+/RO2RYQ34zqV/xceLbeRrMCKAxNs5uQY6shjt3n9tamh6bV8TP0tB6sH7CF
jFLiQ8y6VZvbtoeA6S3WXMwCrcXc/soUqiGEMxThw7t1XFZ1oK101dvy+cMcGZT1
WHHQJFOwsFh0KQNXEb1odBI87jNnBQFQ7rj/xIVkd123T7ga7ywSIFw6ZLZxAsr2
HqCjAl5TjweBb6L0381S1THh+nqAO/1XEEFiJIJV+35dp4Zom3zkS8mKm6X0C3gZ
3zqOy3oLBdgNrZrj1LB/NfZT0pqMuvLad/HDEj6b8p8mUbGn5gmLXdtgAc0HEK2e
5Ps+GF1YaiGdAWdih0crhMBXpO6KdMo/pwmw7Bt8j1J81b/gBkEMQ5yc+rTYTkPC
txlwZjznt0oF9XXILFr3iQYa/8BvirKfhjb+k5Q3TRaI9d6acKL8CzJzDpiVq+lE
xUVKm4IyVm1PxeZTgeyqdkrWy4c6dz9DhNuxpr79vo5BWGpWi/Dm0Ym4Grkmq6zl
5aTC+psPuDu8a5TLmD3JjpGUtNyy3V7qHQUcgBeP1hHDBilTDRA=
=sHBM
-----END PGP SIGNATURE-----

--FeP9e8KaBxtJxEsZr2idMziV53Ac65aQ6--

