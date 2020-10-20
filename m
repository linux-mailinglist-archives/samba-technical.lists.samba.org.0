Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D3453294382
	for <lists+samba-technical@lfdr.de>; Tue, 20 Oct 2020 21:50:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=rKU0/2CX9dKb6Gowi+0plbJ5NE4cmFN9JVdGzTzWiTw=; b=S+kQ1/dOvk0fWQxwFyzkETmcV1
	4G9UpIJWm7/pjrGKuRyDlnz22v/k4v971ljUPZvUvNEXikLGqcf7tLl3M+IOpveeHV8OciIpNJYfS
	t8D7Lb19CKUXrcL3FHY2ccT3L0NgtwUuH3mvtmGG9/7g8X9Kl+vH8v42mX4xuWVelKHs9TE6TNAtJ
	3Yd9H5WNj6c8AXWnuiE7kzvJmrujoXA/esd3+sULCaFjoGWQW3IALw/hfof8G+UZNv0tU8U5gWVO1
	/XTdlkuNIoI4Jlnt7x+lP9jnsabZRc2GiSPy1HiP68n+aRpQGp1fyELWdaODlJeRFYzuj+ntmjQYa
	4C3Au+7w==;
Received: from ip6-localhost ([::1]:30758 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUxeN-00CxLJ-J3; Tue, 20 Oct 2020 19:50:27 +0000
Received: from mail.networkradius.com ([62.210.147.122]:52449) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUxe7-00CxJ7-TN
 for samba-technical@lists.samba.org; Tue, 20 Oct 2020 19:50:15 +0000
Received: from shinyhead.rga.ip (unknown [187.142.130.164])
 by mail.networkradius.com (Postfix) with ESMTPSA id E8C144FD;
 Tue, 20 Oct 2020 19:50:07 +0000 (UTC)
Authentication-Results: NetworkRADIUS; dmarc=none (p=none dis=none)
 header.from=freeradius.org
Message-Id: <1C33DF9F-997C-40B0-980F-0AE27C43E1DD@freeradius.org>
Content-Type: multipart/mixed;
 boundary="Apple-Mail=_AB390C2B-7A3A-4516-9C10-1531B903175D"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: talloc: talloc_set_memlimit causes all reallocs to fail when used
 on pools.   talloc_set_memlimit not enforced correctly on pools.
Date: Tue, 20 Oct 2020 14:50:05 -0500
In-Reply-To: <20201020191654.GF642265@jeremy-acer>
To: Jeremy Allison <jra@samba.org>
References: <E2A6FEEF-3C46-43A6-818C-D226924EB9F7@freeradius.org>
 <20201016202528.GF67086@jeremy-acer>
 <E75C5FB4-2800-498A-868B-7F3A3CB4E802@freeradius.org>
 <20201020020246.GB564927@jeremy-acer> <20201020035308.GA601524@jeremy-acer>
 <2F0B2708-7AC6-4FF5-99FA-8D4B8F1BAB2E@freeradius.org>
 <20201020055023.GA606244@jeremy-acer>
 <D37CFB0F-61FE-43C4-A161-DB949FF9F175@freeradius.org>
 <20201020183336.GB642265@jeremy-acer>
 <69C11FCA-3EF2-4E1F-9835-5D3FFB80D883@freeradius.org>
 <20201020191654.GF642265@jeremy-acer>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
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
From: Arran Cudbard-Bell via samba-technical <samba-technical@lists.samba.org>
Reply-To: Arran Cudbard-Bell <a.cudbardb@freeradius.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--Apple-Mail=_AB390C2B-7A3A-4516-9C10-1531B903175D
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



> On Oct 20, 2020, at 2:16 PM, Jeremy Allison <jra@samba.org> wrote:
> 
> On Tue, Oct 20, 2020 at 01:42:00PM -0500, Arran Cudbard-Bell wrote:
>> 
>> 
>>> On Oct 20, 2020, at 1:33 PM, Jeremy Allison <jra@samba.org> wrote:
>>> 
>>> On Tue, Oct 20, 2020 at 01:03:14PM -0500, Arran Cudbard-Bell wrote:
>>>> 
>>>> Then there's another issue with object_count ending
>>>> up off by one, which means talloc_free_children doesn't
>>>> actually return memory to the pool, and that messes up
>>>> some of the other tests I'm adding.  Just tracking down
>>>> when and why this happens now.... It might have been a
>>>> pre-existing issue and not related to this patch, I'm just
>>>> seeing it because of using talloc_free_children to reset
>>>> the pool between some tests.
>> 
>> Apologies, there was a steal I didn't spot in the tests.
>> One of the chunks was moved out of the pool into the root ctx.
>> 
>> Explicitly freeing the chunk or stealing it back into the pool
>> means talloc_free_children works as expected.
> 
> FYI, once you've gotten everything working can you
> send your test cases to me so I can add them into
> the regression test suite for talloc ?

Attached.

> Then we'll add a new bug in bugzilla, update the minor library
> version number and create a gitlab MR.

Sounds good, thanks!

-Arran



--Apple-Mail=_AB390C2B-7A3A-4516-9C10-1531B903175D
Content-Disposition: attachment;
	filename=0001-Add-more-debugging-text-for-existing-memlimit-pool-t.patch
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="0001-Add-more-debugging-text-for-existing-memlimit-pool-t.patch"
Content-Transfer-Encoding: quoted-printable

=46rom=208ceab8aa93994274d6bed6d07894eb66535079e7=20Mon=20Sep=2017=20=
00:00:00=202001=0AFrom:=20Arran=20Cudbard-Bell=20=
<a.cudbardb@freeradius.org>=0ADate:=20Tue,=2020=20Oct=202020=2014:10:30=20=
-0500=0ASubject:=20[PATCH]=20Add=20more=20debugging=20text=20for=20=
existing=20memlimit=20+=20pool=20tests=0A=0ASigned-off-by:=20Arran=20=
Cudbard-Bell=20<a.cudbardb@freeradius.org>=0A---=0A=20=
lib/talloc/testsuite.c=20|=2014=20++++++++++++++=0A=201=20file=20=
changed,=2014=20insertions(+)=0A=0Adiff=20--git=20=
a/lib/talloc/testsuite.c=20b/lib/talloc/testsuite.c=0Aindex=20=
6c9bf203b7c..571c32ca00f=20100644=0A---=20a/lib/talloc/testsuite.c=0A+++=20=
b/lib/talloc/testsuite.c=0A@@=20-1767,24=20+1767,38=20@@=20static=20bool=20=
test_memlimit(void)=0A=20=09talloc_free(root);=0A=20=0A=20=09/*=20Test=20=
memlimits=20with=20pools.=20*/=0A+=09printf("=3D=3D=3D=3D=20=
talloc_pool(NULL,=2010*1024)\n");=0A=20=09pool=20=3D=20talloc_pool(NULL,=20=
10*1024);=0A=20=09torture_assert("memlimit",=20pool=20!=3D=20NULL,=0A=20=09=
=09"failed:=20alloc=20should=20not=20fail=20due=20to=20memory=20=
limit\n");=0A+=0A+=09printf("=3D=3D=3D=3D=20talloc_set_memlimit(pool,=20=
10*1024)\n");=0A=20=09talloc_set_memlimit(pool,=2010*1024);=0A=20=09for=20=
(i=20=3D=200;=20i=20<=209;=20i++)=20{=0A+=09=09printf("=3D=3D=3D=3D=20=
talloc_size(pool,=201024)=20%i/10\n",=20i=20+=201);=0A=20=09=09l1=20=3D=20=
talloc_size(pool,=201024);=0A=20=09=09torture_assert("memlimit",=20l1=20=
!=3D=20NULL,=0A=20=09=09=09"failed:=20alloc=20should=20not=20fail=20due=20=
to=20memory=20limit\n");=0A+=09=09talloc_report_full(pool,=20stdout);=0A=20=
=09}=0A=20=09/*=20The=20next=20alloc=20should=20fail.=20*/=0A+=09=
printf("=3D=3D=3D=3D=20talloc_size(pool,=201024)=2010/10\n");=0A=20=09l2=20=
=3D=20talloc_size(pool,=201024);=0A=20=09torture_assert("memlimit",=20l2=20=
=3D=3D=20NULL,=0A=20=09=09=09"failed:=20alloc=20should=20fail=20due=20to=20=
memory=20limit\n");=0A=20=0A+=09talloc_report_full(pool,=20stdout);=0A+=0A=
=20=09/*=20Moving=20one=20of=20the=20children=20shouldn't=20change=20the=20=
limit,=0A=20=09=20=20=20as=20it's=20still=20inside=20the=20pool.=20*/=0A=
+=0A+=09printf("=3D=3D=3D=3D=20talloc_new(NULL)\n");=0A=20=09root=20=3D=20=
talloc_new(NULL);=0A+=0A+=09printf("=3D=3D=3D=3D=20talloc_steal(root,=20=
l1)\n");=0A=20=09talloc_steal(root,=20l1);=0A+=0A+=09printf("=3D=3D=3D=3D=20=
talloc_size(pool,=201024)\n");=0A=20=09l2=20=3D=20talloc_size(pool,=20=
1024);=0A=20=09torture_assert("memlimit",=20l2=20=3D=3D=20NULL,=0A=20=09=09=
=09"failed:=20alloc=20should=20fail=20due=20to=20memory=20limit\n");=0A=
--=20=0A2.28.0=0A=0A=

--Apple-Mail=_AB390C2B-7A3A-4516-9C10-1531B903175D
Content-Disposition: attachment;
	filename=0002-More-tests-for-realloc-when-used-with-memlimited-poo.patch
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="0002-More-tests-for-realloc-when-used-with-memlimited-poo.patch"
Content-Transfer-Encoding: quoted-printable

=46rom=20a41b69c122bb416680a7db9f1cdb2cdb6f511af0=20Mon=20Sep=2017=20=
00:00:00=202001=0AFrom:=20Arran=20Cudbard-Bell=20=
<a.cudbardb@freeradius.org>=0ADate:=20Tue,=2020=20Oct=202020=2014:12:17=20=
-0500=0ASubject:=20[PATCH]=20More=20tests=20for=20realloc=20when=20used=20=
with=20memlimited=20pools=0A=0ASigned-off-by:=20Arran=20Cudbard-Bell=20=
<a.cudbardb@freeradius.org>=0A---=0A=20lib/talloc/testsuite.c=20|=20103=20=
+++++++++++++++++++++++++++++++++++++++++=0A=201=20file=20changed,=20103=20=
insertions(+)=0A=0Adiff=20--git=20a/lib/talloc/testsuite.c=20=
b/lib/talloc/testsuite.c=0Aindex=20571c32ca00f..6f23ad4e18a=20100644=0A=
---=20a/lib/talloc/testsuite.c=0A+++=20b/lib/talloc/testsuite.c=0A@@=20=
-1803,6=20+1803,109=20@@=20static=20bool=20test_memlimit(void)=0A=20=09=
torture_assert("memlimit",=20l2=20=3D=3D=20NULL,=0A=20=09=09=09"failed:=20=
alloc=20should=20fail=20due=20to=20memory=20limit\n");=0A=20=0A+=09=
printf("=3D=3D=3D=3D=20talloc_free_children(pool)\n");=0A+=09=
talloc_free(l1);=0A+=09talloc_free_children(pool);=0A+=0A+=09=
printf("=3D=3D=3D=3D=20talloc_size(pool,=201024)\n");=0A+=09l1=20=3D=20=
talloc_size(pool,=201024);=0A+=0A+=09/*=20try=20reallocs=20of=20=
increasing=20size=20*/=0A+=09for=20(i=20=3D=201;=20i=20<=209;=20i++)=20{=0A=
+=09=09printf("=3D=3D=3D=3D=20talloc_realloc_size(NULL,=20l1,=20%i*1024)=20=
%i/10\n",=20i,=20i=20+=201);=0A+=09=09l1=20=3D=20=
talloc_realloc_size(NULL,=20l1,=20i*1024);=0A+=09=09=
torture_assert("memlimit",=20l1=20!=3D=20NULL,=0A+=09=09=09"failed:=20=
realloc=20should=20not=20fail=20due=20to=20memory=20limit\n");=0A+=09=09=
talloc_report_full(pool,=20stdout);=0A+=09}=0A+=09/*=20The=20next=20=
alloc=20should=20fail.=20*/=0A+=09printf("=3D=3D=3D=3D=20=
talloc_realloc_size(NULL,=20l1,=2010*1024)=2010/10\n");=0A+=09l2=20=3D=20=
talloc_realloc_size(NULL,=20l1,=2010*1024);=0A+=09=
torture_assert("memlimit",=20l2=20=3D=3D=20NULL,=0A+=09=09=09"failed:=20=
realloc=20should=20fail=20due=20to=20memory=20limit\n");=0A+=0A+=09/*=20=
Increase=20the=20memlimit=20*/=0A+=09printf("=3D=3D=3D=3D=20=
talloc_set_memlimit(pool,=2011*1024)\n");=0A+=09=
talloc_set_memlimit(pool,=2011*1024);=0A+=0A+=09/*=20The=20final=20=
realloc=20should=20still=20fail=0A+=09=20=20=20as=20the=20entire=20=
realloced=20chunk=20needs=20to=20be=20moved=20out=20of=20the=20pool=20*/=0A=
+=09printf("=3D=3D=3D=3D=20talloc_realloc_size(NULL,=20l1,=2010*1024)=20=
10/10\n");=0A+=09l2=20=3D=20talloc_realloc_size(NULL,=20l1,=2010*1024);=0A=
+=09torture_assert("memlimit",=20l2=20=3D=3D=20NULL,=0A+=09=09=09=
"failed:=20realloc=20should=20fail=20due=20to=20memory=20limit\n");=0A+=0A=
+=09talloc_report_full(pool,=20stdout);=0A+=0A+=09printf("=3D=3D=3D=3D=20=
talloc_set_memlimit(pool,=2021*1024)\n");=0A+=09=
talloc_set_memlimit(pool,=2021*1024);=0A+=0A+=09/*=20There's=20now=20=
sufficient=20space=20to=20move=20the=20chunk=20out=20of=20the=20pool=20=
*/=0A+=09printf("=3D=3D=3D=3D=20talloc_realloc_size(NULL,=20l1,=20=
10*1024)=2010/10\n");=0A+=09l2=20=3D=20talloc_realloc_size(NULL,=20l1,=20=
10*1024);=0A+=09torture_assert("memlimit",=20l2=20!=3D=20NULL,=0A+=09=09=09=
"failed:=20realloc=20should=20not=20fail=20due=20to=20memory=20=
limit\n");=0A+=0A+=09talloc_report_full(pool,=20stdout);=0A+=0A+=09/*=20=
...which=20should=20mean=20smaller=20allocations=20can=20now=20occur=20=
within=20the=20pool=20*/=0A+=09printf("=3D=3D=3D=3D=20talloc_size(pool,=20=
9*1024)\n");=0A+=09l1=20=3D=20talloc_size(pool,=209*1024);=0A+=09=
torture_assert("memlimit",=20l1=20!=3D=20NULL,=0A+=09=09=09"failed:=20=
new=20allocations=20should=20be=20allowed=20in=20the=20pool\n");=0A+=0A+=09=
talloc_report_full(pool,=20stdout);=0A+=0A+=09/*=20But=20reallocs=20=
bigger=20than=20the=20pool=20will=20still=20fail=20*/=0A+=09printf("=3D=3D=
=3D=3D=20talloc_realloc_size(NULL,=20l1,=2010*1024)\n");=0A+=09l2=20=3D=20=
talloc_realloc_size(NULL,=20l1,=2010*1024);=0A+=09=
torture_assert("memlimit",=20l2=20=3D=3D=20NULL,=0A+=09=09=09"failed:=20=
realloc=20should=20fail=20due=20to=20memory=20limit\n");=0A+=0A+=09=
talloc_report_full(pool,=20stdout);=0A+=0A+=09/*=20..as=20well=20as=20=
allocs=20*/=0A+=09printf("=3D=3D=3D=3D=20talloc_size(pool,=201024)\n");=0A=
+=09l1=20=3D=20talloc_size(pool,=201024);=0A+=09=
torture_assert("memlimit",=20l1=20=3D=3D=20NULL,=0A+=09=09=09"failed:=20=
alloc=20should=20fail=20due=20to=20memory=20limit\n");=0A+=0A+=09=
talloc_report_full(pool,=20stdout);=0A+=0A+=09printf("=3D=3D=3D=3D=20=
talloc_free_children(pool)\n");=0A+=09talloc_free_children(pool);=0A+=0A=
+=09printf("=3D=3D=3D=3D=20talloc_set_memlimit(pool,=201024)\n");=0A+=09=
talloc_set_memlimit(pool,=201024);=0A+=0A+=09/*=20We=20should=20still=20=
be=20able=20to=20allocate=20up=20to=20the=20pool=20limit=0A+=09=20=20=20=
because=20the=20memlimit=20only=20applies=20to=20new=20heap=20=
allocations=20*/=0A+=09printf("=3D=3D=3D=3D=20talloc_size(pool,=20=
9*1024)\n");=0A+=09l1=20=3D=20talloc_size(pool,=209*1024);=0A+=09=
torture_assert("memlimit",=20l1=20!=3D=20NULL,=0A+=09=09=09"failed:=20=
alloc=20should=20not=20fail=20due=20to=20memory=20limit\n");=0A+=0A+=09=
talloc_report_full(pool,=20stdout);=0A+=0A+=09l1=20=3D=20=
talloc_size(pool,=201024);=0A+=09torture_assert("memlimit",=20l1=20=3D=3D=20=
NULL,=0A+=09=09=09"failed:=20alloc=20should=20fail=20due=20to=20memory=20=
limit\n");=0A+=0A+=09talloc_report_full(pool,=20stdout);=0A+=0A+=09=
printf("=3D=3D=3D=3D=20talloc_free_children(pool)\n");=0A+=09=
talloc_free_children(pool);=0A+=0A+=09printf("=3D=3D=3D=3D=20=
talloc_set_memlimit(pool,=2010*1024)\n");=0A+=09=
talloc_set_memlimit(pool,=2010*1024);=0A+=0A+=09printf("=3D=3D=3D=3D=20=
talloc_size(pool,=201024)\n");=0A+=09l1=20=3D=20talloc_size(pool,=20=
1024);=0A+=09torture_assert("memlimit",=20l1=20!=3D=20NULL,=0A+=09=09=09=
"failed:=20alloc=20should=20not=20fail=20due=20to=20memory=20limit\n");=0A=
+=0A+=09talloc_report_full(pool,=20stdout);=0A+=0A=20=09=
talloc_free(pool);=0A=20=09talloc_free(root);=0A=20=09printf("success:=20=
memlimit\n");=0A--=20=0A2.28.0=0A=0A=

--Apple-Mail=_AB390C2B-7A3A-4516-9C10-1531B903175D
Content-Disposition: attachment;
	filename=0003-Add-note-on-memlimit-and-pools.patch
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="0003-Add-note-on-memlimit-and-pools.patch"
Content-Transfer-Encoding: quoted-printable

=46rom=200f5293f8777534d4048a370510ca5311889bc624=20Mon=20Sep=2017=20=
00:00:00=202001=0AFrom:=20Arran=20Cudbard-Bell=20=
<a.cudbardb@freeradius.org>=0ADate:=20Tue,=2020=20Oct=202020=2014:48:35=20=
-0500=0ASubject:=20[PATCH]=20Add=20note=20on=20memlimit=20and=20pools=0A=0A=
Signed-off-by:=20Arran=20Cudbard-Bell=20<a.cudbardb@freeradius.org>=0A=
---=0A=20lib/talloc/talloc.h=20|=204=20++++=0A=201=20file=20changed,=204=20=
insertions(+)=0A=0Adiff=20--git=20a/lib/talloc/talloc.h=20=
b/lib/talloc/talloc.h=0Aindex=200154bf3bbf6..bd88c056e7a=20100644=0A---=20=
a/lib/talloc/talloc.h=0A+++=20b/lib/talloc/talloc.h=0A@@=20-1920,6=20=
+1920,10=20@@=20void=20talloc_set_log_stderr(void);=0A=20=20*=09=20=20=
move=20causes=20the=20new=20parent=20to=20exceed=20its=20limits.=20=
However=0A=20=20*=09=20=20any=20further=20allocation=20on=20that=20=
hierarchy=20will=20then=20fail.=0A=20=20*=0A+=20*=20@note=20When=20used=20=
with=20pools=20talloc=20memlimit=20will=20apply=20only=20to=20memory=0A+=20=
*=09=20allocated=20outside=20of=20the=20pool.=20All=20allocations=20up=20=
to=20the=20size=0A+=20*=09=20of=20the=20pool=20will=20succeed=20=
irrespective=20of=20any=20memlimit=20set.=0A+=20*=0A=20=20*=20@warning=20=
talloc=20memlimit=20functionality=20is=20deprecated.=20Please=0A=20=20*=09=
=20=20=20=20consider=20using=20cgroup=20memory=20limits=20instead.=0A=20=20=
*=0A--=20=0A2.28.0=0A=0A=

--Apple-Mail=_AB390C2B-7A3A-4516-9C10-1531B903175D--

