Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E19093F7F47
	for <lists+samba-technical@lfdr.de>; Thu, 26 Aug 2021 02:28:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=BUDksw4ypqlYgTncIcjXlCedW6vx3+FDl7h2s+VxHWc=; b=wYy6H8oEefV2MRXBxhCXgH7630
	hf26Pwv0naQKZPu5/8jQaWQk8QTkSZNzFH9DrdlERy8crPFfeUVav0zXnyUu0wCaWhfFYOv1njmMN
	KX6PoX4uonGJrgYkRwogMB5im/PaGJePDqlqecrD/BQbUHwMoEOCmSrUw2opQfPSYth+TIvcDs5Ry
	KmgjYwLAOoRU4b87C1n7Qpf5i5iyPQ/MNyHgz2nmdOZxyJeIJD4IQW7kkPph/o37hKQeQgbxVlyzz
	mG10mEcODvtkAjoBh9YPzrKumgquGNLjzqvBXZ3SpvNh/Y65S0j8GmvxZNVbWjQniHpEhAPppxRTH
	5tVuQe8A==;
Received: from ip6-localhost ([::1]:37882 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mJ3El-009Obh-95; Thu, 26 Aug 2021 00:27:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24024) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mJ3Ed-009ObY-Gn
 for samba-technical@lists.samba.org; Thu, 26 Aug 2021 00:27:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=BUDksw4ypqlYgTncIcjXlCedW6vx3+FDl7h2s+VxHWc=; b=Bnhmj7hJ3QybC5Yij3QZySVXJy
 HuPK9im49ghYFtD5vFBolViLEiiqQH3+JJzP7eHBVGRE9TulEmIOHDbcfB8cZKhohDMNVvJE0sJw5
 DXEzvJBoJ+dsU0kmgKGI87VGxqRhU9+mH/97SKh9I9tOunTq4wLlk994VarijcbK88zfddAWHFhTt
 tsUC0vgNnAJ4+MQi5f7c4ksxzwyGAlH0MVfjUebOfI7idahJHVl2V3qBmNle0KH3QKvm7PPU+HSUT
 XRLePe7PfoNgCx5HTtc3oNd02UFTFVpdeq7kJjS+Hw91BTuHNy4jNPmeuhU7d8vKdY17Auuxk8Nsi
 NNsTryf95QNeEK2Hv6nW8GE6VkgO798cP8kih8NQQf/Dnbh+x4CU1ShB0jZO8yXq/9DQSPYPkbGJh
 thwmu5wN7wAGEpCtOn+WimeXf0gLm/KzBD9YGsG50N0lO0tX7iz6LbM21AcqT7YVuI/MearT7WD2q
 1saTvlW9NMU5Q3uCCylvHmdX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mJ3Eb-0032pD-5v; Thu, 26 Aug 2021 00:27:09 +0000
Message-ID: <394a5fccee57136810d714fbffe9bd4e2e6af49e.camel@samba.org>
Subject: Re: Heimdal upgrade, really happening this time
To: Stefan Metzmacher <metze@samba.org>, Upstream Samba Technical Mailing
 list <samba-technical@lists.samba.org>, Isaac Boukris <iboukris@gmail.com>
Date: Thu, 26 Aug 2021 12:27:01 +1200
In-Reply-To: <57d08d6d05bf60ebc0965a311cae267f539f277f.camel@samba.org>
References: <b2cb195314281883e378c908784ac6f9f841584d.camel@samba.org>
 <26713d5cdcc47d0d9fb017b6a1e546d9501d8efe.camel@samba.org>
 <c328766b-d894-517f-966c-fa5305558633@samba.org>
 <a78f79643b03b31afbe505b932df2cc46fb0254d.camel@samba.org>
 <0a68b013c3d1d6988d54ef5473a47e50973d0892.camel@samba.org>
 <fb006a0427d71d5f05a6217ff19e12974a6b647d.camel@samba.org>
 <376f7f62-7ebd-fa37-45d9-dda065f7517d@samba.org>
 <57d08d6d05bf60ebc0965a311cae267f539f277f.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Just another update on the Heimdal upgrade.

I was motivated to rebase again so we could potentially allow Luke to
test his new FAST changes with our tests.

All the Samba-specific patches to Heimdal are now in lorikeet-heimdal,
and are listed here:

c946d9e63dcefcc2f99fbe32e8f8eff24262abb9 (HEAD -> lorikeet-heimdal-tmp, lorikeet-heimdal/lorikeet-heimdal-202108260003, lorikeet-heimdal-202108260003) source4/heimdal/lib/krb5/init_creds_pw.c KRB5_NT_ENTERPRISE_PRINCIPAL ctx->flags.canonicalize = 1
da776d5299ab3e843fd56c5edc9a557b6d7d0b87 source4/heimdal/lib/krb5/mcache.c anonymous resolving
40a36415a01da169e74a6e2b77c8b26fd93e93d5 tgs-rep: always return canonical realm
342ad14433cabae9e15dea43d73ae62217988f58 TODO: auth: For NTLM and KDC authentication, log the authentication duration
947caea4cdd2c0fffbc69329c0b50b08b1671067 lib/krb5 correctly follow KRB5_KDC_ERR_WRONG_REALM client referrals
299dce8c28a9e1bef1d234a4afec8de549d0c98b TODO CHECK heimdal: Fix loss of information in _gsskrb5_canon_name() from call to krb5_sname_to_principal()
4fc9a9b0a2a37af6a545de7c7c1841152f384375 heimdal: Honour KRB5_CTX_F_DNS_CANONICALIZE_HOSTNAME in parse_name_canon_rules()
f6538470c0f18466bec12aef48ab142c7dbcdb6e TODO: kdc: match new GSS pre-auth prototype to ENC-TS etc
bf0d53ff66c026e38c894c5ac74109c4bd711fdc TODO: heimdal: Pass extra information to hdb_auth_status() to log success and failures
1fd6203e8bb3ce04a519f1a6c1ecd75d4377c263 Change KDC to respect HDB server name type if f.canonicalize is set
f22b2b980078ab9f52d6bbe4cb48395c57b7f777 lib/krb5 correctly follow KRB5_KDC_ERR_WRONG_REALM client referrals
c9b20508c251b8e190dec4e554b68c325c1acac2 HEIMDAL:kdc: make it possible to disable the principal based referral detection
85ab37844b4819b1c30e4b642c13774cddd0f9b9 lib/krb5: windows KDCs always return the canoncalized server principal
e5ec1c4f8b08d927d8abe0bdce8d81dfde7bc3a1 HACK: Netbios Domain as Realm
8a2fd96dfe00306dc64df75731cf3fa0fa42b0f9 kdc: use the correct kvno number for PKINIT in the AS-REP
3b73118dd77dfec525958aba9353f893785be847 kdc: add krb5plugin_windc_pac_pk_generate() hook

I need to stop now but next I'll see about dropping the 
 source4/heimdal/lib/krb5/init_creds_pw.c KRB5_NT_ENTERPRISE_PRINCIPAL ctx->flags.canonicalize = 1
patch

We also need to fix our KDC tests not to use the -1111 enc type, as
Heimdal considers it (correctly per the RFC) as 'modern'.  We need to
perhaps change it to 3des or such to get the pattern we want.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


