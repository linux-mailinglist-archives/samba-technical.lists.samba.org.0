Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F56E8EFA
	for <lists+samba-technical@lfdr.de>; Tue, 29 Oct 2019 19:07:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=HENyw+iZtpX4NZ0J8tlISv7y7xe54pg7zNP6SNmIhNc=; b=BiaWXLsLKuiMDXl+acgGhTc5/G
	kbmWYkXJlOB1jBMthew3UsVE0jn3CBNN+cVmtt5gEtTmcXJGL6o5zYUPjPFKvUXuisp+UZQB0LO6V
	v2F7f7KXcGU2JI8AoKvN19utiJkg/AGOxB/2kkeTNIv+8JZ8eSCZfCIIKBqvNu//jQPGUNPcqGkmw
	ZqYlW1fl9OztSSzGUCs2hAQwUaEH/zvo4t4YIGGaK2n4saIGih1G7zh9+vdQQkjeR7/WdPDzuTzpc
	aKw0/IGFwVzxxdypZiDhM7UXyMBu0ftvuNrRPCJfsHlXAFthr4YraQZvCX68zEmH0+aIBKFFaxCu7
	B+vwwqKQ==;
Received: from localhost ([::1]:42692 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iPVtJ-003NIg-6s; Tue, 29 Oct 2019 18:06:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25324) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iPVtE-003NIZ-Hs
 for samba-technical@lists.samba.org; Tue, 29 Oct 2019 18:06:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=HENyw+iZtpX4NZ0J8tlISv7y7xe54pg7zNP6SNmIhNc=; b=Qt8/f0GvdRpqdaWBA0+SmGjV/Q
 5WZHWlrhj+ojdW0cB6goYC2vqn7xwMJkgH0KR2ZWfP6DhDyRiqtkMxuu5GOWNV1Vktoj7+4MB6I1h
 pFp/JRlGI0H4vdmwV6BjpwVbyIap1uT+zGYZsmlmS8BcZ6mtfCbSU/NwwNVrU2GdoHX3Civz4iGsc
 mZ4e2bA2vVwSmjjBC3/i6Ef3c//gB9HfQnggoMeFbx+FRjJPYus2aGfTbZEeuf2Oeec2mmawOv2pt
 4waxl2HZs+t1F1zwRy+0UkhgAauAx6rQowvY93ck2WvMx+Uv/ARE+PVgaH2BdSQDDZugos7nwjHMc
 ZDF3bm0OZYsH6V4t/jyjqWxOTAJRClYAMW1y3H+UrUIQQmFIYpN/wkpZlvCEkZXY65RghIfrgMLgf
 nSxxb2wO1ekpF7P966C4x02kyk4vQiym0+ZtPw6BaybaAwUKDH125Cn/r0fDOVzXiNaBg09Im6UEy
 dXGxFlPmYZMxkpS9Lz1QDW5b;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iPVtE-0001ET-14; Tue, 29 Oct 2019 18:06:44 +0000
Subject: Re: Q: how to build with system Heimdal
To: Christof Schmitt <cs@samba.org>
References: <07c7a4cf-b874-d9ae-ce9f-909345b27265@samba.org>
 <20191029171833.GA13244@samba.org>
Message-ID: <5d738a0a-13c5-7ac0-4cc4-3aa6e6c81627@samba.org>
Date: Tue, 29 Oct 2019 20:06:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191029171833.GA13244@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 29/10/2019 19:18, Christof Schmitt wrote:
> On Fri, Oct 25, 2019 at 12:33:33AM +0300, Uri Simchoni via samba-technical wrote:
>> Hi,
>>
>> How should I build Samba with system heimdal? Should this do the trick:
>> ./configure --with-system-heimdalkrb5 --without-ad-dc
>> make
>>
>> (assuming I have Heimdal installed, of course)
>>
>> I tried this one on master, configure succeeds and the build fails
>> like so (kind of surprising that it tries building system heimdal):
>>
>> waf: Entering directory `/home/vagrant/samba/bin/default'
>>          Selected system Heimdal build
>> [190/192] Compiling source4/heimdal/lib/vers/print_version.c
>> 21:26:51 runner ['/usr/bin/gcc', '-D_SAMBA_BUILD_=4',
>> '-DHAVE_CONFIG_H=1', '-MMD', '-D_GNU_SOURCE=1',
>> '-D_XOPEN_SOURCE_EXTENDED=1', '-DHAVE_CONFIG_H=1', '-fPIC',
>> '-D__STDC_WANT_LIB_EXT1__=1', '-D_REENTRANT',
>> '-fstack-protector-strong',
>> '-DSTATIC_HEIMDAL_VERS_HOSTCC_MODULES=NULL',
>> '-DSTATIC_HEIMDAL_VERS_HOSTCC_MODULES_PROTO=extern void
>> __HEIMDAL_VERS_HOSTCC_dummy_module_proto(void)',
>> '-Isource4/heimdal_build', '-I../../source4/heimdal_build',
>> '-Iinclude/public', '-I../../include/public', '-Isource4',
>> '-I../../source4', '-Ilib', '-I../../lib', '-Isource4/lib',
>> '-I../../source4/lib', '-Isource4/include',
>> '-I../../source4/include', '-Iinclude', '-I../../include',
>> '-Ilib/replace', '-I../../lib/replace', '-I.', '-I../..',
>> '../../source4/heimdal/lib/vers/print_version.c', '-c', '-o/home/vagrant/samba/bin/default/source4/heimdal/lib/vers/print_version.c.1.o']
>> In file included from ../../source4/heimdal_build/roken.h:156:0,
>>                   from ../../source4/heimdal/lib/vers/print_version.c:39:
>> ../../source4/heimdal/lib/roken/roken.h.in:282:10: fatal error:
>> roken-common.h: No such file or directory
>>   #include <roken-common.h>
>>            ^~~~~~~~~~~~~~~~
>> compilation terminated.
> 
> This should work, but it broke back with Samba 4.10. The build works
> with Samba 4.9. I am trying to bisect and debug this problem now.
> 
> Christof
> 

Oh, thanks! I didn't want to start actually debugging this before being 
sure I'm not missing some basic thing. Do note however that all of waf 
has been replaced for 4.10, so maybe it's more a matter of getting this 
back in shape than bisecting.

I wanted to push forward another cross-compilation patch that involves 
removal of an explicit path of Heimdal headers, so I wanted to see if 
that breaks system-heimdal build and then realized it's broken before 
the patch.

Uri.

