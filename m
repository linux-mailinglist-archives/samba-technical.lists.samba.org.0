Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B364C7E2
	for <lists+samba-technical@lfdr.de>; Thu, 20 Jun 2019 09:09:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=KBFSTCwGh/XTMiSphMWrH+si/6Kmop6r3vmQNP1etvI=; b=F/+ZclCyB6e9CZjZNgRlDzBEsi
	pK7UKeYLvgpuOmtr6Wp1Iw7lxprswWjn7dZP611RT786U20gI0ZmfEm+b0r14KTg+GpvIgO645BSa
	0KFwSOyYQBTjMKCq47dzp9aqYuyOtKoHSDT83mqCBqOfs+/n6lnaLixu2NGyilY23MDIS2jQnQrlA
	T0a2SYFfxsEMY+YRBBPgWQiXrK9O6d2T6EgW3j3Snbx2jZjBVhRaEiSUPGdRTTJQ/1O4CpS7k9z5S
	/b4LOQdriqx7c+rEf0fu5H10XKjYhHUF4eXNS711JqCKZHVMcgrxrwTya0MWa3zl1U80ftHfUvfa/
	4WZ81Zyw==;
Received: from localhost ([::1]:60530 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hdrBt-000cbr-V5; Thu, 20 Jun 2019 07:09:02 +0000
Received: from mail-pf1-f175.google.com ([209.85.210.175]:43526) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hdrBj-000cbj-LA
 for samba-technical@lists.samba.org; Thu, 20 Jun 2019 07:08:54 +0000
Received: by mail-pf1-f175.google.com with SMTP id i189so1115158pfg.10
 for <samba-technical@lists.samba.org>; Thu, 20 Jun 2019 00:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=DuNrckdJdHQB309+Uy/Y5obf2Ns64z0CjxvqMo+Tbc0=;
 b=hr5aloiieRz83QsIQyTGwHOUDcCklfr2mKHoR5O3S6QLrsZcEg0gRef/nbmy9Agxtz
 QOJ0gp7wpTfeiwrVQ9CegrjQI6yMZz4uOZ58IKeCMB0LQtnMuC2UnJaQKZPA2t6fYa/1
 Ufcvj8kgMNtMPBUrvlZO8aVsnaiRJHcRsg5CbK9ddVZfju/yBupToiMwJh2xT0XqK2TO
 jwfgIjTj7YIhf292ZXdaIJdh084MQavSrvag/JuXjqJqLxKM5rs3CyQEa7MhfPloksua
 IeIAKNti3zNl3s+UYSGJkWhNg0tTwh57DMn585BQZAWxz7IXJnxc5KmnHD8G0CYRaCxk
 qZFw==
X-Gm-Message-State: APjAAAXza/zmvWyWUq+iR7UAXomjBMtfCFNckSBK/dSCYVQ3NQXr0L/R
 ZRqx584L+tp6HEkcBcUEnjkOpOkmxzo=
X-Google-Smtp-Source: APXvYqyCqTxjX8D1msXC1vL/S3sV43xv9UwT2YdJRcJNH6xJoS+6OSs3p1b6Ri0pYkWrxJTvuBMdBA==
X-Received: by 2002:a62:3605:: with SMTP id d5mr130331487pfa.28.1561014529207; 
 Thu, 20 Jun 2019 00:08:49 -0700 (PDT)
Received: from amitkuma.pnq.csb ([125.16.200.50])
 by smtp.gmail.com with ESMTPSA id l44sm5260328pje.29.2019.06.20.00.08.47
 for <samba-technical@lists.samba.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2019 00:08:48 -0700 (PDT)
Subject: Every-time Pipeline failing [Pulling docker image
 gitlab/gitlab-runner-helper:x86_64-58d8360f .. ERROR: Job failed: execution
 took longer than 1h0m0s seconds]
To: samba-technical@lists.samba.org
References: <1b05eb02-d234-1d70-ecba-3fc8b3da57dc@redhat.com>
Message-ID: <5d99326e-ebee-ae3d-a882-b1ae68fb1b8e@redhat.com>
Date: Thu, 20 Jun 2019 12:38:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1b05eb02-d234-1d70-ecba-3fc8b3da57dc@redhat.com>
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Amit Kumar via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amit Kumar <amitkuma@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Dear Devels,

My pipeline(https://gitlab.com/amitkuma/samba/-/jobs/235933064) keeps on
failing on "samba-ad-dc-2" test case.

Pulling docker image gitlab/gitlab-runner-helper:x86_64-58d8360f ...
ERROR: Job failed: execution took longer than 1h0m0s seconds

My patch(https://gitlab.com/samba-team/samba/merge_requests/524) is
simple, addition below in "docs-xml/manpages/net.8.xml"

<refsect2>

<title>ADS GPO</title>

<refsect3>
<title>ADS GPO APPLY [<replaceable>USERNAME</replaceable>]
[<replaceable>MACHINENAME</replaceable>]</title>
<para>Apply GPOs for user/machine.</para>
</refsect3>

<refsect3>
<title>ADS GPO GETGPO [<replaceable>GPO</replaceable>]</title>
<para>List specified GPO.</para>
</refsect3>

<refsect3>
<title>ADS GPO LINKADD [<replaceable>LINKDN</replaceable>]
[<replaceable>GPODN</replaceable>]</title>
<para>Link a container to a GPO. <replaceable>LINKDN</replaceable>
Container to link to a GPO. <replaceable>GPODN</replaceable> GPO to link
container to. DNs must be provided properly escaped. See RFC 4514 for
details.</para>
</refsect3>

<refsect3>
<title>ADS GPO LINKADD [<replaceable>LINKDN</replaceable>]
[<replaceable>GPODN</replaceable>]</title>
<para>Link a container to a GPO. <replaceable>LINKDN</replaceable>
Container to link to a GPO. <replaceable>GPODN</replaceable> GPO to link
container to. DNs must be provided properly escaped. See RFC 4514 for
details.</para>
</refsect3>

<refsect3>
<title>ADS GPO LINKGET [<replaceable>CONTAINER</replaceable>]</title>
<para>Lists gPLink of a containter.</para>
</refsect3>

<refsect3>
<title>ADS GPO LIST [<replaceable>USERNAME</replaceable>]
[<replaceable>MACHINENAME</replaceable>]</title>
<para>Lists all GPOs for user/machine.</para>
</refsect3>

<refsect3>
<title>ADS GPO LISTALL</title>
<para>Lists all GPOs on a DC.</para>
</refsect3>

<refsect3>
<title>ADS GPO REFRESH [<replaceable>USERNAME</replaceable>]
[<replaceable>MACHINENAME</replaceable>]</title>
<para>Lists all GPOs assigned to an account and download them.
<replaceable>USERNAME</replaceable> User to refresh GPOs for.
<replaceable>MACHINENAME</replaceable> Machine to refresh GPOs for.</para>
</refsect3>

</refsect2>

I am working on building a docker image as mentioned here:
https://wiki.samba.org/index.php/Samba_CI_on_gitlab/Debugging_CI_failures

Any help is Appreciated!!

Amit


On 06/05/2019 05:10 PM, Amit Kumar wrote:
>
> :) Again, CI/CD pipeline failed for "samba-ad-dc-2"
>
> /tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:                                
> value                    : DATA_BLOB length=16
> /tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:                            
> keys: struct secrets_domain_info1_kerberos_key
> /tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:                                
> keytype                  : 0x00000017 (23)
> /tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:                                
> iteration_count          : 0x00001000 (4096)
> /tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:                                
> value                    : DATA_BLOB length=16
> /tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:                            
> keys: struct secrets_domain_info1_kerberos_key
> /tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:                                
> keytype                  : 0x00000003 (3)
> /tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:                                
> iteration_count          : 0x00001000 (4096)
> /tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:                                
> value                    : DATA_BLOB length=8
> /tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:                
> old_password             : NULL
> /tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:                
> older_password           : NULL
> /tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:
> secrets_store_domain_info: SEC_CHAN_* not supported for SAMBADOMAIN
> /tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:
> secrets_fetch_or_upgrade_domain_info: secrets_store_domain_info()
> failed for SAMBADOMAIN - NT_STATUS_INTERNAL_ERROR
> /tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:
> fill_mem_keytab_from_secrets:
> secrets_fetch_or_upgrade_domain_info(SAMBADOMAIN) -
> NT_STATUS_INTERNAL_ERROR
> /tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:
> ../../source3/librpc/crypto/gse_krb5.c:591: Error! Unable to set mem
> keytab - -1765328254
> /tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd: Failed to start
> GENSEC server mech gse_krb5: NT_STATUS_INTERNAL_ERROR
> /tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd:
> ../../source3/libads/authdata.c:278Failed to start server-side GENSEC
> krb5 to validate a Kerberos ticket: NT_STATUS_INTERNAL_ERROR
> /tmp/samba-testbase/b21/samba-ad-dc-2/bin/winbindd: kinit failed for
> 'Administrator@SAMBA.EXAMPLE.COM' with: Preauthentication failed
> (-1765328360)
>
> ==> /builds/amitkuma/samba/samba-ad-dc-2.stdout <==
> [60(451)/67 at 34m8s] samba4.krb5.kdc with account DENIED permission
> to replicate to an RODC(rodc)
>
> ==> /builds/amitkuma/samba/samba-ad-dc-2.stderr <==
> python3: WARNING: The "lsa over netlogon" option is deprecated
> python3: WARNING: The "server schannel" option is deprecated
>
> ==> /builds/amitkuma/samba/samba-ad-dc-2.stdout <==
> [61(748)/67 at 35m35s] samba4.krb5.kdc with account ALLOWED permission
> to replicate to an RODC(rodc)
> [62(1237)/67 at 37m10s] samba4.krb5.kdc with machine account(rodc:local)
>
> ==> /builds/amitkuma/samba/samba-ad-dc-2.stderr <==
> python3: WARNING: The "lsa over netlogon" option is deprecated
> python3: WARNING: The "server schannel" option is deprecated
> python3: WARNING: The "lsa over netlogon" option is deprecated
> python3: WARNING: The "server schannel" option is deprecated
> Pulling docker image gitlab/gitlab-runner-helper:x86_64-ac2a293c ...
> ERROR: Job failed: execution took longer than 1h0m0s seconds

