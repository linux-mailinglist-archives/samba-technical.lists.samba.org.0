Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE3934ABBB
	for <lists+samba-technical@lfdr.de>; Fri, 26 Mar 2021 16:44:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=lCPQuZU5PpP9GNulHG/sMrpfQZDPTx/9DjN7H8sp13k=; b=p2oEWNV3nQR5ssILiwsqJ7l/nk
	78Xy4y5LukVQaJHyYZv7q9GnDHQwLqamUVgIyrgzDP+afXbfikU4faG5jg/Y8BNKq046SKfr386pc
	sdKrp0eow2+jN1LbvavFq5Puqbsx1w1OUj50eT4HoKJN5Kg+ukFAzDcK+64zIA7+l1gC8MdO8H3Nc
	Ukv2sQQLqFzUVwLgJbvhUhxZeMmjyPqGd5JSznEyAP9cqbagVIlWo0Fu+yD9lZxsyS5nu+mmHFI8Q
	waZ2Gg2imuMrKs49IsAa9rsfawXsxpndYVc3EoDvuYrMX8rqMJsY8cWWsMKsSDMzczYtO7lQQgIqF
	3nDjXLlQ==;
Received: from ip6-localhost ([::1]:27816 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lPocH-006rxG-VH; Fri, 26 Mar 2021 15:43:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43174) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lPoc8-006rx9-VY
 for samba-technical@lists.samba.org; Fri, 26 Mar 2021 15:43:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=lCPQuZU5PpP9GNulHG/sMrpfQZDPTx/9DjN7H8sp13k=; b=0OEsMQ3It2bOdW01gO6YB0pOT6
 KF+H4+c8JZoMDfWuS99vbKGjkJZDi0eFoOWUepO594wtaYAwuCv6kUUY759VKraHJNJd33sSNDo89
 xkjPbSe16F0vgKrql0EnGeQod1uIOI69LZfH7K7QN2dAlhsUwC7y9gisWXyG8LL+1O8Cgsx+xiNhb
 ttuKXsWvd7EN5CL0qovKvyScwMZ9wO8D8ZW6WfeIQbqlXgrtQSugLyB6NibDfmSmc0QXdZ6rpVXrq
 /bxWpoofKAd2FdfyS11RO0hzogM+C8Jozxhn5SE1Iq+ug8pYwkxvkl7mMW5zaQuABHXLiHgI2icd+
 YyjJH23PoGWoeB5YA83vpGxXbdTe2duuZ+MURfKmxPoqWrHVbXxOk4FyWg/qAFh8TZOxfCI2096/7
 h2U73GiZDN0CyVZ38Ob/vEmlNKVww1s8xg6nYA6X37sD0HqjXCjyLcqzLE8mPJjPwrEhVVQRcfok2
 MOaQxJ4vSZP393+wj8SfY8U5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lPoc6-0003h3-B2; Fri, 26 Mar 2021 15:43:06 +0000
Message-ID: <303ff972bd89688d3d71ef4cf49cc6dbb3995b2c.camel@samba.org>
Subject: Re: vfs_full_audit annoyances on major version upgrades
To: Anders =?ISO-8859-1?Q?=D6stling?= <anders.ostling@gmail.com>, 
 samba-technical@lists.samba.org, Andrew Walker <walker.aj325@gmail.com>
Date: Sat, 27 Mar 2021 04:41:31 +1300
In-Reply-To: <a4eca426-b03b-49e3-9292-6dfd76b883e9@Spark>
References: <c34eafed-8d23-43f8-b282-6c98800fefe5@Spark>
 <a4eca426-b03b-49e3-9292-6dfd76b883e9@Spark>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Fri, 2021-03-26 at 16:28 +0100, Anders Östling via samba-technical
wrote:
> Hi
> 
> Newbie here, but I would like to comment todays post by Andrew Walker’s  regarding audit logging.
> 
> C systems programming is not new to me, although it is about 15 years since I wrote anything serious. The proposed patch looks fine to me, but I believe that a better way is to burp and inform the user about the change in keywords/syntax, at least when there are behind-the-scene changes like this one describes. Or maybe “testparm” should look at the config lines a little more in detail. Maybe both proposed solutions could be combined.
> 
> Another point is that the logging format from the AD-DC modules seems to be completely different from what SMBD uses. A common format would IMO make it much much easier to consolidate, parse and analyse logs in an automated way. Maybe that’s a pipers dream, but still … here is an example of what I mean
> 
> AD-DC (Global config for formatting  full_audit:prefix = IP=%I | USER=%u | MACHINE=%m | VOLUME=%S - (seems to be ignored))
> 
> [2021/03/26 16:09:27.394208,  3] ../../auth/auth_log.c:653(log_authentication_event_human_readable)
>   Auth: [Kerberos KDC,ENC-TS Pre-authentication] user [(null)]\[anders@HOGANAS-PLATSLAGAREN.SE] at [Fri, 26 Mar 2021 16:09:27.394194 CET] with [aes256-cts-hmac-sha1-96] status [NT_STATUS_OK] workstation [(null)] remote host [ipv4:10.0.100.14:39820] became [HPAB]\[anders] [S-1-5-21-1399469354-1941875790-2784827883-1601]. local host [NULL]

Yes, we regret adding this logging format.  We added JSON formatted
logs at the same time and they were enthusiastically received, compared
to the work it took to write and test both, we should have just done
the JSON.

> SMBD (Global config for formatting full_audit:prefix = IP=%I | USER=%u | MACHINE=%m | VOLUME=%S (used as specified)
> 
> Mar 26 16:10:45 fs1a smbd_audit[62673]: IP=10.0.100.14 | USER=HPAB\anders | MACHINE=10.0.100.14 | VOLUME=Dokument|get_nt_acl_at|ok|/share/documents
> Mar 26 16:10:45 fs1a smbd_audit[62673]: IP=10.0.100.14 | USER=HPAB\anders | MACHINE=10.0.100.14 | VOLUME=Dokument|close|ok|/share/documents
> 
> I have a few more thoughts, but I will save them for later. I will download the sources myself and see if I can understand hos logging is structured. Who knows, maybe this old fart can contribute with something later on!

I think the general mood is that we should move to JSON for structured
logging, as that is what modern log ingestion tools prefer.  

I wrote the following to another developer who was at the time
interested in reworking the vfs_full_audit to output JSON:


Most important hint is to remember to tie the entries to each other -
so include:

      rc = json_add_guid(
            &authorization, "sessionId", &session_info->
unique_session_token);

        if (rc != 0) {
                goto failure;
        }

This helps the administrator map the audit entry back to the
authorization in a deterministic manner. 

For inspiration the other place to look is the audit code in the DSDB
module stack. 

source4/dsdb/samdb/ldb_modules/audit_log.c

This logs things quite similar to what you will be targeting, so should
be good inspiration.

Testing is best using python or cmocka (for unit tests).  The python
tests listen on a messaging socket and get a stream of JSON audit
entries over this connection.

git ls-files| grep audit| grep dsdb

Back on the design question, just note how Gary added a major and minor
version to the JSON output, so that any consumer can know that the JSON
formatting has changed.  

I hope this is of assistance.

Andrew Bartlett
-- 
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba



