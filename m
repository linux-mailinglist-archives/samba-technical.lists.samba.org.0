Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A986C1E28
	for <lists+samba-technical@lfdr.de>; Mon, 20 Mar 2023 18:36:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=AfiMAQmxO8Pm+MVTNQs9amSfjK7bj2zBT5OnJinIFWY=; b=YOQ5Cgq8n9sYmub3hc2W03s5st
	zidaXEAJtdHTVbiG7PUTbsyAkFBOLB2eNWPuywydNgg7tvth/z8HF/7wZI8hEdjeeYq/UfKqJ+Zxl
	/Nuw+pslrYY7c4OA1ntRV8M3krzRfTe5EgJqj1S4gfsiwvtslWt276E+EJXnjNS7b1Q+7Rl9wuWzR
	lZ+QsPzLNbKzdRtRrKKqdAp6O5C2xOOIAjZ10ZlLw+aYj64aYUzzePhzRwwG2OBUf2x1mEUXxUkMK
	NVVl/68VTho5w/4wiOa3uHYxLVlSCoFTkeh95G3zvz1pUeTMXH+U+Jzoqsy04wHGbwAZT49SYOWDB
	3vwP032Q==;
Received: from ip6-localhost ([::1]:23626 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1peJQ5-003fBu-O1; Mon, 20 Mar 2023 17:35:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11070) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1peJPz-003fBl-OH
 for samba-technical@lists.samba.org; Mon, 20 Mar 2023 17:35:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=AfiMAQmxO8Pm+MVTNQs9amSfjK7bj2zBT5OnJinIFWY=; b=QVoaGXKSAmMVk6If+5sE2FZImc
 ArU0J5HJhAx3RP9twLpNa8SC98uchSVfVNqKNmxso77TenYITIMk+JpWd8Z/Rp4XYwSx08T63kJp0
 y1xVY8QQl45ZvKQBCWuvJJwpafcTZc7m1QrlPveFofh4U/uiJQmmo2eUSoTQcjqlD1LDgpdk6MMWa
 WWVlmwGwu1feKXenzNy+KJE938XLJ1L9vXGWFXmYP6XxhZfYw08jQ4a7ZHUE56CM01Yb3F/RYI2y5
 Vz9FfJ2ZH1kD82kmP5Qq2/w0CY4yxeEk3H+bt1wwPuplf8CLcixQ0QDfTzf6O/MZBofcLzxZ4joyI
 E6+nDwk80NcZbyfPlhvG6A9Srwwc8g3HTCWwbOIesmMy83aK72FiWVBljV5LJgyCr7BnHYXPscXsP
 2286chqyeTvRtd0n5brCiuCX9lKzxaoqQGOkK7IjsLZwT9jhgT3vglBbDy+aDStSDjjHsGQJgHtDX
 5Fi8bpzfy0Z0yl07uyhw8Gq1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1peJPy-004TVf-SR; Mon, 20 Mar 2023 17:35:34 +0000
To: samba-technical@lists.samba.org
Subject: Re: Failing tests on Fedora
Date: Mon, 20 Mar 2023 18:35:33 +0100
Message-ID: <2152679.irdbgypaU6@magrathea>
In-Reply-To: <4782393.GXAFRqVoOG@magrathea>
References: <4782393.GXAFRqVoOG@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, 16 February 2023 09:04:21 CET Andreas Schneider via samba-
technical wrote:
> Hi,
> 
> I'm currently trying to run 'make test' as part of the RPM build process
> (%check). So I'm trying to get everything working, but I'm seeing strange
> issues and I need some help to track them down.
> 
> The errors happen only if I run a full 'make test' and I don't see them when
> running the test individually (make test TESTS="..").
> 
> Lets take a look at the samba.tests.samba_tool.gpo_exts.ad_dc_ntvfs test.
> 
> [2583(16283)/2929 at 1h59m32s, 15 errors]
> samba.tests.samba_tool.gpo_exts(ad_dc_ntvfs:local)
> UNEXPECTED(failure):
> samba.tests.samba_tool.gpo_exts.samba.tests.samba_tool.gpo_exts.GpoCmdTestCa
> se.test_vgp_access_add(ad_dc_ntvfs:local) REASON: Exception: Exception:
> Traceback (most recent call last):
>   File "/builddir/build/BUILD/samba-4.18.0rc2/bin/python/samba/tests/
> samba_tool/gpo_exts.py", line 111, in test_vgp_access_add
>     self.assertCmdSuccess(result, out, err, 'Access add failed')
>   File "/builddir/build/BUILD/samba-4.18.0rc2/bin/python/samba/tests/
> samba_tool/base.py", line 97, in assertCmdSuccess
>     self.assertIsNone(exit, msg=msg.replace("\n]\n", "\n] \n"))
> AssertionError: -1 is not None : exit[-1] stdout[] stderr[ERROR: Unable to
> find user or group "testuser"
> ]: Access add failed
> 
> The pattern is the same with other tests failing.


Interestingly the samba.tests.samba_tool.gpo tests fail against ad_dc_ntvfs 
but succeed against ad_dc!



Something is fishy with that env.

UNEXPECTED(failure): 
samba.tests.samba_tool.gpo.samba.tests.samba_tool.gpo.GpoCmdTestCase.test_admx_load(ad_dc_ntvfs:local)                                                         
REASON: Exception: Exception: Traceback (most recent call last):                                                                                                                    
  File "/builddir/build/BUILD/samba-4.18.0/bin/python/samba/tests/samba_tool/
gpo.py", line 583, in test_admx_load                                                                   
    self.assertTrue(os.path.exists(admx_path),                                                                                                                                      
AssertionError: False is not true : PolicyDefinitions was not created

The command interestingly succeeds, but then it fails to find the policy 
definitions. Maybe we have an issue with exported variables in that env.


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



