Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E27B0401C95
	for <lists+samba-technical@lfdr.de>; Mon,  6 Sep 2021 15:45:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Y4RAEGK5v7hT5u6zgqov6rNjC7lASZ/lfwKOCGGK2mc=; b=qu84TOzY7ubCJAZ9DhAETLkrMr
	IzX1XZ42wGTC2qN+FDLywz9400SKwzNujGA2YwBhnXCekWaff8fj0kYUo7d8ejj1ssEW/Dn8Btrc6
	zqQFyYdgQ7moQwAjPVen2bBd6uvWhi0WC9N1ZmUHIhJ3OvFOhNRqak3nQyjfoCp89RFBNAd8OgE/V
	z8rM7oNHshtvoRH+Zqe/TJ7CwQd2PDTYAwLXFpYfE8ZXqqFgnB2gEFeVSVKfKAWrsIk6BbYupErEb
	ruyeT7dKIjnncji1fAvdgQZfdstCaY0nxbsafRlLOv/LKRR+y7mZI0TZxYvVigggt5Fs/DmrUZJ5i
	DAioFkQg==;
Received: from ip6-localhost ([::1]:40642 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mNEwC-00DVQv-DN; Mon, 06 Sep 2021 13:45:28 +0000
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:56269) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1mNEw5-00DVQm-2G
 for samba-technical@lists.samba.org; Mon, 06 Sep 2021 13:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1630935918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y4RAEGK5v7hT5u6zgqov6rNjC7lASZ/lfwKOCGGK2mc=;
 b=DWBfg6vtSeEagNfA3fFFNyyoGk2ZMrIPPkokoUwMAhWuZyAb/biTF4dMcxnJHdzlh1EkWC
 hO15DfPbwRJ4xDNNcOLOioK0BLujv4FyD+L/VMv86F6fe2La8CCR5vVIkGLDkNWgGDyFij
 +VrmLFqVQIVsZCaxr/+XzBUitun4D5o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1630935918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y4RAEGK5v7hT5u6zgqov6rNjC7lASZ/lfwKOCGGK2mc=;
 b=DWBfg6vtSeEagNfA3fFFNyyoGk2ZMrIPPkokoUwMAhWuZyAb/biTF4dMcxnJHdzlh1EkWC
 hO15DfPbwRJ4xDNNcOLOioK0BLujv4FyD+L/VMv86F6fe2La8CCR5vVIkGLDkNWgGDyFij
 +VrmLFqVQIVsZCaxr/+XzBUitun4D5o=
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-cHZED1MoP4qHv3KHdMOhvQ-1; Mon, 06 Sep 2021 15:29:40 +0200
X-MC-Unique: cHZED1MoP4qHv3KHdMOhvQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKD42h4Cz9KVvsF3Aa8tMjNSlnPszS0dSXghKRNbvuTRJiWRlhNCfm/aP8bfqsbwpcX8KAmZJld6PQev4wzB+HDQNCldprQ7zxoR2Jbo6g4wJaNiJaKin3kQc6RhDuV20NJl5TwF9saCCY3tdHDuLYnIEHf3S1p78/wstVoDoAxTj4cwtr+xzNxVDu0Y/3H1hWXEN3cABcQfOPc+TLq4opf75POcVosYY7EFMImlQVVWl3TOPbizAKIS9p4FokrzjISH4gAne2C2DfMpTy9UcMdTOyIetCVC1QAOh29M7/4D83uff1XP4IIgzViJlcPKN6fr8siCodfGVBvd3ontEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=llvFvzkMVFT+zCCnedkQ3QMxVZ+xDvR6xhlWkLfqIYk=;
 b=aqCUi/WsgAso+aNmTq1YPBvHKchhrURj4Hl81EEd75vEHnVa5IAlnrZT3iHQetqZPSpzK2i9AugQvcLez8HoGcMPprXLG6CJjvDjZDiG8hbqscG/1JEsv8OaJJDj0mzPiYKahtDJubJToW5DL4wmKedeos7+kYL6/vmpJybfnltypMLLvzFJXwwCgey+NePioLcKrC+J6pOoZdq8gRVIPVL0cxucvhfDWgIKrHtqMLTf8/xO2jtvcj62ytdS1fH9mYmSjSZKY7ik6zjX4S3uihO/tOJ20XBF5/vm/DZny/hybh4+VSRDd8CMgzsuTYekONZlVF+Qi5xSsOsSI99bpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.samba.org; dkim=none (message not signed)
 header.d=none;lists.samba.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB4883.eurprd04.prod.outlook.com (2603:10a6:208:c5::12)
 by AM8PR04MB7729.eurprd04.prod.outlook.com (2603:10a6:20b:24c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Mon, 6 Sep
 2021 13:29:39 +0000
Received: from AM0PR04MB4883.eurprd04.prod.outlook.com
 ([fe80::84f2:954f:40af:3983]) by AM0PR04MB4883.eurprd04.prod.outlook.com
 ([fe80::84f2:954f:40af:3983%5]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 13:29:39 +0000
Subject: Re: Test failure in samba.tests.blackbox.smbcacls_basic(DFS)
 (resending from with mail account subscribed to list)
To: Joseph Sutton <josephsutton@catalyst.net.nz>,
 samba-technical@lists.samba.org
References: <f4a174ef-09bc-6b7b-dc1a-d4cb0311bc8a@catalyst.net.nz>
Message-ID: <4e900ead-8985-d4e3-0b4d-dc67f1fa5044@suse.com>
Date: Mon, 6 Sep 2021 14:29:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <f4a174ef-09bc-6b7b-dc1a-d4cb0311bc8a@catalyst.net.nz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.8] (109.78.60.177) by
 AM3PR07CA0126.eurprd07.prod.outlook.com (2603:10a6:207:8::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.4 via Frontend Transport; Mon, 6 Sep 2021 13:29:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 510425b5-6f3c-413c-fd2e-08d9713a60a1
X-MS-TrafficTypeDiagnostic: AM8PR04MB7729:
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Message-Info: LXOZ6hfuvu+muD5PerLUHK5I1QgP8nq+8aXzKzx4Oon3xf/hYtPu+zLgaXQnzmV4hqBqJbxfqkFTTvIFPsSqtwxzsaKMLFwa+31W2PuTL+i82haY2j324snh4y4IYtIIIi1U1s2IkdQ5XxiiADB0P+l8Lgf+bY03t9t0PBFDHbU3KVi1fI+sEo+GOiom9qYQWa19BQj4zl9AhSIFrgBSrF2y1sJb+ifu9ZLZjQ0hsT0JEnX1eR1OgRArYuLSkBWRl2SfR3qIitF7vJtDuTRuGFEOnmC/Oza2ighA3FBDnSrukJpjiU5wk5MZgSdZIR1iYPDtBJZy3HW7KSMOoTzFb5tP/nYZbs4Q19PKNG7h/hIvYZB46GCpC72AjGB/1nfHuPi6SKF+8z82zl7qd/2MLSH54BRStRevX1/F58KBSJIkAmXQiv68VDw8gpYdVsW0ueWmAapPd7mJDR28bPRCjkdUGeFtcKtXRAUZr0Czp9E4oH22xdKF2Jb3d8RXm8xsvuuB55LNRS8My5WOzFg5onPoX/s433HEL4UJXayde9aAJNvO1eZHOyxlFt25PpOdJJuiRWxCtaOsF0KPJabIgnCyxTkai7uu1ogXzHSXNuj10jKcvYrns5AXVcswNSBvjPWV7313PA1Xsdwj+n96U3K3EJnXaPNk+hMm5sop2fbhAqh7YqW9/V1ma7vstKDeD+OS/+I+TWHJ5gCmS683lhwst8El137qMB08BsIsbCCF4PXB7hjforNmD+dMvE9EmtZyqSXGaIKoMlcElAcmPphrICczoV9jaKgEyAzoGjMJuXNVpAcL0SbFkVH/Uhku
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nOZpsBSl5vV2vq6Dqz02cvU4ciQJJRXzTTMDp8GmqOsSoUE8OFAL7xGM2Lkb?=
 =?us-ascii?Q?U0EWCv2UVR/soHepdo7qVB2+VyIyZK52BPBgjrr5GIpm63H3y85uiwXALw04?=
 =?us-ascii?Q?6bdwXydnTzVrf86fZbsfDXhk/TdOoQK3l7fA4qXwtUX8XN3h4vElHndpSASs?=
 =?us-ascii?Q?lC8zncu3FFGhtHk9oIdQFGnbWWm+nZ4Xbpgss7+qlRmqu2tJe+qCZ4BrR/pS?=
 =?us-ascii?Q?YWv6/9HqmS7LK+nMAawx0VVP18iKuwTr88E6EsFoKcRw+umgusNkkjbAAYM/?=
 =?us-ascii?Q?VwJBpUNEnSHzrtZkGpxlbFFSg/sRWOqPh3LXFJwKuWPS4Lj42CRyXNjhjBHw?=
 =?us-ascii?Q?V4qCrZDz3Rp8zRsk2Mz3tiGEGnPLqF1Rb51olmsmz9E12VJv1xcJYvkv+7W5?=
 =?us-ascii?Q?8ILJznO5gciMiXQgBUs+NbI30rjZvOl56kLXXkCmFZ+unYb5bTBdD0t3mnpT?=
 =?us-ascii?Q?PvAiLG4nuYJHvZ61QiOWTfBhxQa8WaMRqmDHFipSuB+VQNIHdj5w714sjG8z?=
 =?us-ascii?Q?jRgmT2cMd7KfeBLkIsBPxMkdOwZulG0zIUppKbCMSPnwzI6QYAh1LXlgUDVR?=
 =?us-ascii?Q?oqw7qB/9MuXbE24pO4CfODgVkUvxvYd2mqdeOmK+LnLJjOvk2+eyIbK9vCnV?=
 =?us-ascii?Q?rYRuTj9jmNNQwEOodBPlUfQxwRl3OClz2OPOVnkyC/fkIJ10SbDlDFu14NTd?=
 =?us-ascii?Q?1nWP/hMfCijGVxLzle+6gBwf2OQsZJxAsyyNaPVyuvREXnOklsrgc7m9Rww/?=
 =?us-ascii?Q?ygzKuVTvhq4eF6Ps9SmCGbNkJGkcHaJTV4kFL7amaVqLwYk4JAhAcds8N/+X?=
 =?us-ascii?Q?31iUjnAwlIuFVizUuAHa6NI3tluTs+3xDxb1iTrFP1HLgNhD0DYqZvJOARDl?=
 =?us-ascii?Q?kJcoNTK7BUbPnkDRbAyQlYzeDMTm33/eaRCyXBNAcdL3OvfDJTEzn2hfDyDl?=
 =?us-ascii?Q?jWEcGJhItuI+MbZuWBS5965fVbeJe81H/3a9dNcYdhuPwQ+z7xwQeuTMmurZ?=
 =?us-ascii?Q?JAOCTQ657WDvqialShEJPWTPn4nUKmPn4ZfJkesmpNps6zmk1M7UTkUCnt/i?=
 =?us-ascii?Q?Ei5HWBT7Yzs4+J53zZYVwjNsLCowofi5+SQYMV0huQ2BfmAljYH+ofTEEzNL?=
 =?us-ascii?Q?LqTZ9lXtdlYDaWM243Ua9pKRUJwUifZi4nVjDo5PCpNb9uYuaPZ9My1Dk4Gu?=
 =?us-ascii?Q?fxC2DB2vFaQLON1Icy0yVFgoJ1uqdWeitOBE+5azEnvudjcpTwyiX6/xlB8v?=
 =?us-ascii?Q?cgd9rVb9/g/u2BzIJP22wuiiQlxcXXwMj3kUYQ7bHfwxoiWYzEcoiBXw/UYU?=
 =?us-ascii?Q?jomgLstnGEC+/XOf9uWQKSDW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 510425b5-6f3c-413c-fd2e-08d9713a60a1
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB4883.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wcvAIu7jJ5lsnOuPYBFJATMBmyKyxO4YTa0VBjRAgppI3Tws0AQukFwa385wpJTGgoBkTBSC/6AWe1cy4iNxrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7729
X-Warn: TLS-SNI hr1.samba.org
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
From: Noel Power via samba-technical <samba-technical@lists.samba.org>
Reply-To: Noel Power <nopower@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Joseph,

On 06/09/2021 09:34, Joseph Sutton via samba-technical wrote:
> I noticed this failure occurring with the samba-no-opath2 job on GitLab
> CI, after rebasing seemingly unrelated changes onto master.

Yeah, kerberos changes shouldn't affect this test :-)
Have to say I haven't seen that test flap before, I do see that it seems
that the test has since passed, hopefully this is just some really
random failure rather than something more malicious (and hard to debug)
Unfortunately the log doesn't tell much (but it seems to indicate the=C2=A0
basic smbcacls --set operation failed or there is some undiscovered bug
in the test where it parses the aces ) but of course I can't reproduce
this locally :-( I suppose we will have to keep an eye on it

Noel
> |[146(644)/150 at 22m53s]
> samba.tests.blackbox.smbcacls_basic(DFS)(fileserver)||
> ||found ACE for samba||
> ||mismatch: inherit: !=3D inherit:0x0||
> ||differences between file ACE: ||
> ||user_dom=3DFILESERVER,||
> ||user=3Dsamba,||
> ||type=3DALLOWED,||
> ||inherit=3D,||
> ||permissions=3DFULL,||
> ||and expected ACE: ||
> ||user=3Dsamba,||
> ||type=3DALLOWED,||
> ||inherit=3D0x0,||
> ||permissions=3DFULL,||
> ||remote remove failed: Command
> '/tmp/samba-testbase/samba-no-opath-build/bin/smbclient
> -Usamba%fileserver //FILESERVER/msdfs-share -c deltree
> smbcacls_sharedir_dfs/*'; shell False; exit status 1; stdout: 'b''';
> stderr: 'b'''||
> ||falling back to removing contents of local dir:
> /tmp/samba-testbase/samba-no-opath2/bin/ab/fileserver/share/smbcacls_shar=
edir_dfs||
> ||UNEXPECTED(failure):
> samba.tests.blackbox.smbcacls_basic(DFS).samba.tests.blackbox.smbcacls_ba=
sic.BasicSmbCaclsTests.test_simple_single_mod(fileserver)||
> ||REASON: Exception: Exception: Traceback (most recent call last):||
> ||=C2=A0 File "bin/python/samba/tests/blackbox/smbcacls_basic.py", line 7=
7,
> in test_simple_single_mod||
> ||=C2=A0=C2=A0=C2=A0 self.assertTrue(self.file_ace_check(remotepath, ace)=
)||
> ||AssertionError: False is not true||
> ||FAILED (1 failures, 0 errors and 0 unexpected successes in 0 testsuites=
)|
>
> The full job log can be found here:
> https://gitlab.com/samba-team/devel/samba/-/jobs/1564265401
> <https://gitlab.com/samba-team/devel/samba/-/jobs/1564265401>
>
> I'm not sure exactly what caused this failure, but I'm reporting it here
> in case this is an issue that could warrant further investigation.
>
> Regards,
> Joseph
>



