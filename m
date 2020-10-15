Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1B328EFBB
	for <lists+samba-technical@lfdr.de>; Thu, 15 Oct 2020 11:59:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=qehRLxDu4eucftrH3Z7Zt6AjsEscLFKvOlk7EQTZC0E=; b=VsGnlqP/IXXQvGa7edWus+YiWK
	k5zv6Ljsq7GV4uIlA4OKum51e8ioMn8iZdCUaQVA9rU5US4eX7lsWZ87SU2RWXpuiFoow9j2KtLFV
	rh7QnyVdaadEhaoptYYdLWej6MJes/1i7Kl7hgrhjIDmpDmq4mmVHwfkIUmKpMJdiaZQFq0PF0rS9
	8gDnu5wPe7F/T0Rkmx4Sar3XMo0QK0v9mhF6jNojXpXmTEWetUBsoACKlYFPBM5gH6LLd8AUd1Fui
	/JcOcVvhOU9CtlCqfzCvDGOWJ6PkggQA2zRK8/mlRYFOaH7w70TYWBK85k5eIVj1AoVzZuMSLPNST
	6HOyepbQ==;
Received: from ip6-localhost ([::1]:62270 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kT01X-00CCBc-0f; Thu, 15 Oct 2020 09:58:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37176) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT01R-00CCBV-QR
 for samba-technical@lists.samba.org; Thu, 15 Oct 2020 09:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:To:From:CC;
 bh=qehRLxDu4eucftrH3Z7Zt6AjsEscLFKvOlk7EQTZC0E=; b=tu0so0M1kl7HmI60w33e2aAA9P
 BOWJA8Ke8V9uF/uc/DYNvqu4VmyHqBRy+GvGHZMaZfxOEwmYX+oMlH3i4Ot3/VIhKRrq647gtcZpy
 DdnKEiDAliE6A8Aj78/GiOxtoX6KkM8Vr6A17ikZn/FUzNSOF++nKHxg7OYCho+AmajGfreXpusg5
 AEFxpOXdivyvmgnF7WyaKCFR1pQ4/lzzsoxbABigbRm6knmuAzuVBJNemmDjzy2e0YgNpFOsSFLAQ
 G0Cwoh53S8Ox42hlZiBrl6Y7Y+kZ7TFiCLkzcZzlJdt2VmkuIvfx6IbYe+bhhl/W/rbZmWpKTcQ+g
 BYKxpYzv8YwTH8OTf+kRr4jbJ965dGwGg/3z8YA5fPdN8flmr3206zRBt/6T1hN1Wun9ktovScljz
 ukmePGqBJOESblvhVK03IjyyQ4/is9/DCMB7q+Z8p2E7KqnNRibJA5fG8Le63T/vJZbZBk5vAh81e
 +xPQtoO22yZ2HI8GJTc9A66F;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT01R-0006wa-46; Thu, 15 Oct 2020 09:58:09 +0000
To: Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
Subject: Samba with multichannel and io_uring
Message-ID: <53d63041-5931-c5f2-2f31-50b5cbe09ec8@samba.org>
Date: Thu, 15 Oct 2020 11:58:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="fwr2KfH9iFI5Yr1EhisxVqHEHD2ohK4cf"
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
--fwr2KfH9iFI5Yr1EhisxVqHEHD2ohK4cf
Content-Type: multipart/mixed; boundary="5gBNgfoZ1knQBRewR2KhkxORD6uHTTkmh";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
Message-ID: <53d63041-5931-c5f2-2f31-50b5cbe09ec8@samba.org>
Subject: Samba with multichannel and io_uring

--5gBNgfoZ1knQBRewR2KhkxORD6uHTTkmh
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

related to my talk at the virtual storage developer conference
"multichannel / iouring Status Update within Samba"
(https://www.samba.org/~metze/presentations/2020/SDC/),
I have some additional updates.

DDN was so kind to sponsor about a week of research on real world
hardware with 100GBit/s interfaces and two NUMA nodes per server.

I was able to improve the performance drastically.

I concentrated on SMB2 read performance, but similar improvements would b=
e expected for write too.

We used "server multi channel support =3D yes" and the network interface =
is RSS capable,
it means that a Windows client uses 4 connections by default.

I first tested a share using /dev/shm and the results where really slow,
it was not possible to reach more than ~30 GBits/s on the net and ~ 3.8 G=
Bytes/s
from fio.exe.

smbd uses pread() from within a pthread based threadpool for file io
and sendmsg() to deliver the response to the socket. All multichannel
connections are served by the same smbd process (based on the client guid=
).

The main smbd is cpu bound and the helper threads also use quite some cpu=

about ~ 600% in total!

https://www.samba.org/~metze/presentations/2020/SDC/future/read-32GBit-4M=
-2T-shm-sendmsg-top-02.png

It turns out that NUMA access caused a lot of slow down.
The network adapter was connected to numa node 1, so we pinned
the ramdisk and smbd to that node.

  mount -t tmpfs -o size=3D60g,mpol=3Dbind:1 tmpfs /dev/shm-numanode1
  numactl --cpunodebind=3Dnetdev:ens3f0 --membind=3Dnetdev:ens3f0 smbd

With that it was possible to reach ~ 5 GBytes/s from fio.exe

But the main problem remains the kernel is busy copying data
and sendmsg() takes up to 0.5 msecs, which means that we don't process ne=
w requests
during these 0.5 msecs.

I created a prototype that uses IORING_OP_SENDMSG with IOSQE_ASYNC (I use=
d a 5.8.12 kernel)
instead of the sync sendmsg() calls, which means that one kernel thread
(io_wqe_work ~50% cpu) per connection is doing the memory copy to the soc=
ket
and the main smbd only uses ~11% cpu, but we still use > 400% cpu in tota=
l.

https://www.samba.org/~metze/presentations/2020/SDC/future/read-57GBit-4M=
-2T-shm-io-uring-sendmsg-async-top-02.png

But it seems the numa binding for the io_wqe_work thread doesn't seem to =
work as expected,
so the results vary between 5.0 GBytes/s and 7.6 GBytes/s, depending on w=
hich numa node
io_wqe_work kernel threads are running. Also note that the threadpool wit=
h pread was
still faster than using IORING_OP_READV towards the filesystem, the reaso=
n might also
be numa dependent.

https://www.samba.org/~metze/presentations/2020/SDC/future/read-57GBit-4M=
-2T-shm-io-uring-sendmsg-async-numatop-02.png
https://www.samba.org/~metze/presentations/2020/SDC/future/read-57GBit-4M=
-2T-shm-io-uring-sendmsg-async-perf-top-02.png

The main problem is still copy_user_enhanced_fast_string, so I tried to u=
se
IORING_IO_SPLICE (from the filesystem via a pipe to the socket) in order =
to avoid
copying memory around.

With that I was able to reduce the cpu usage of the main smbd to ~6% cpu =
with
io_wqe_work threads using between ~3-6% cpu (filesystem to pipe) and
6-30% cpu (pipe to socket).

But the Windows client wasn't able to reach better numbers than 7.6 GByte=
s/s (65 GBits/s).
Only using "Set-SmbClientConfiguration -ConnectionCountPerRssNetworkInter=
face 16" helped to
get up to 8.9 GBytes/s (76 GBits/s).

With 8 MByte IOs smbd is quite idle at ~ 5% cpu with the io_wqe_work thre=
ads ~100% cpu in total.
https://www.samba.org/~metze/presentations/2020/SDC/future/read-75GBit-8M=
-20T-RSS16-shm-io-uring-splice-top-02.png

With 512 KByte IOs smbd uses ~56% cpu with the io_wqe_work threads ~130% =
cpu in total.
https://www.samba.org/~metze/presentations/2020/SDC/future/read-76GBit-51=
2k-10T-RSS16-shm-io-uring-splice-02.png

With 256 KByte IOS smbd uses ~87% cpu with the io_wqe_work threads ~180% =
cpu in total.
https://www.samba.org/~metze/presentations/2020/SDC/future/read-76GBit-25=
6k-10T-RSS16-shm-io-uring-splice-02.png

In order to get higher numbers I also tested with smbclient.

- With the default configuration (sendmsg and threadpool pread) I was abl=
e to get
  4.2 GBytes/s over a single connection, while smbd with all threads uses=
 ~150% cpu.
  https://www.samba.org/~metze/presentations/2020/SDC/future/read-4.2G-sm=
bclient-shm-sendmsg-pthread.png

- With IORING_IO_SPLICE I was able to get 5 GBytes/s over a single connec=
tion,
  while smbd uses ~ 6% cpu, with 2 io_wqe_work threads (filesystem to pip=
e) at 5.3% cpu each +
  1 io_wqe_work thread (pipe to socket) at ~29% cpu. This is only ~55% cp=
u in total on the server
  and the client is the bottleneck here.
  https://www.samba.org/~metze/presentations/2020/SDC/future/read-5G-smbc=
lient-shm-io-uring-sendmsg-splice-async.png

- With a modified smbclient using a forced client guid I used 4 connectio=
ns into
  a single smbd on the server. With that I was able to reach ~ 11 GBytes/=
s (92 GBits/s)
  (This is similar to what 4 iperf instances are able to reach).
  The main smbd uses 8.6 % cpu with 4 io_wqe_work threads (pipe to socket=
) at ~20% cpu each.
  https://www.samba.org/~metze/presentations/2020/SDC/future/read-11G-smb=
client-same-client-guid-shm-io-uring-splice-async.png

- With 8 smbclient instances over loopback we are able to reach ~ 22 GByt=
es/s (180 GBits/s)
  and smbd uses 22 % cpu.
  https://www.samba.org/~metze/presentations/2020/SDC/future/read-22G-smb=
client-8-same-client-guid-localhost-shm-io-uring-splice.png

So IORING_IO_SPLICE will bring us into a very good shape for streaming re=
ads.
Also note that numa pinning is not really needed here as the memory is no=
t really touched at all.

It's very likely that IORING_IO_RECVMSG in combination with IORING_IO_SPL=
ICE would also improve the write path.

Using AF_KCM socket (Kernel Connection Multiplexor) as wrapper to the
(TCP) stream socket might be able to avoid wakeups for incoming packets a=
nd
should allow better buffer management for incoming packets within smbd.

The prototype/work in process patches are available here:
https://git.samba.org/?p=3Dmetze/samba/wip.git;a=3Dshortlog;h=3Drefs/head=
s/v4-13-multichannel
and
https://git.samba.org/?p=3Dmetze/samba/wip.git;a=3Dshortlog;h=3Drefs/head=
s/master-multichannel

Also notice the missing generic multichannel things via this meta bug:
https://bugzilla.samba.org/show_bug.cgi?id=3D14534

I'm not sure when all this will be production ready, but it's great to kn=
ow
the potential we have on a modern Linux kernel!

Later SMB-Direct should be able to reduce the cpu load of the io_wqe_work=
 threads (pipe to socket)...

metze




--5gBNgfoZ1knQBRewR2KhkxORD6uHTTkmh--

--fwr2KfH9iFI5Yr1EhisxVqHEHD2ohK4cf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl+IHSgACgkQDbX1YShp
vVZfyxAAtiICO7Lyb2hswvFkUsF0mWWXRX7lhUGqixpIS0VYChN/2kyq8h6gq0G+
CLM9ieeqVFHDtuWjXTpUqchRYT/o9y18WaLwB3Qktdi5v+kBnm+/6FIrNqXQbR3M
V1ACm+y5YBzbwg12lJa6wqSHUvCWe3b/R5GTGFrblix2UDwx1RG4C8CUOyj2q3IZ
8mcxIuT4vkv4XQ5KjLL133caoKodlTzjQOU2NR1VI+SKFRX/DRSleNk7LH2Q2KgW
IOA10SFFEea4AU3SsZwCmIHCFYj9h7Ypd3X9fV9zMduK45L3gyYygZSzn6UU1K4X
nCe6066Smxa7DQbd7WAiBntvtCh94Qtq9/9efW22nu/NvzKWDZtIiZCRt1nXRson
WwR1lOGpzt1vYWZ/uaRRlVwgzcu8gkbjmPDSFhEVYsa72zq2dJr6nCuNutEHOGV0
V9IK4+RedTmC4SU4rgKXqCB5nhoZkDHW1ANdwSIqnyZA6+hnNv3oagjB/DPfrG4k
5it08KY2trHhjXXMZ6ZHfr/FwxPpkZ3j+JWxDYWDcDhM9ZuH4RPnt2f2VpCj2dze
JXWrf5+M7vNMxQvn3mJSHk57Z5DX03gYLWhXHkiTQOTXCQzz7b33WfAi5O064Mdq
FrE89NS1ywieV6kPYiFRfgCze6Gwk+h0CzlrkHPgVuNlKs1z5Iw=
=DjwV
-----END PGP SIGNATURE-----

--fwr2KfH9iFI5Yr1EhisxVqHEHD2ohK4cf--

