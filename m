Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F4A479367
	for <lists+samba-technical@lfdr.de>; Fri, 17 Dec 2021 19:00:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:CC:to;
	bh=L6yOS025y5IhjQbx5lQ0NDyu2ysTJbyqxw6sCLsk70A=; b=3DFSgOgNEPBeYfDnXbGcFd6z5R
	9EZBO+FzvzGHZec1B7/qBGy2Ps4ygLcfWrbKsbbqk7JvrYl41Ow1gUauVTNtHGRa7de2onr5DhvHk
	YvCc4d3t3UExF/n6uXta82Ltur9lg7AP8hGlljBKWFiOm05ac208S2by6MZ80KKKDCCZbOGdOgNUl
	/r+71uQ1elvtA8jtMuCyUA8BjaiGjQYwnXm3hDUqZMOXKKLyBPYR4ddi9GxysWZrOPGgrNwXyBrVp
	5mbOrvGu1R8mjxSJSeXE17VfOsvWPPfMtCMNGXfomqRtsM3yGTeDosxAjWO/Z4zWF+WIlDfVTzXAs
	VG2p4aCg==;
Received: from ip6-localhost ([::1]:30896 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1myHVs-0015Mo-Vq; Fri, 17 Dec 2021 17:59:25 +0000
Received: from mx0b-002bd802.pphosted.com ([148.163.155.76]:58134) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1myHVk-0015Mf-JD
 for samba-technical@lists.samba.org; Fri, 17 Dec 2021 17:59:22 +0000
Received: from pps.filterd (m0146914.ppops.net [127.0.0.1])
 by mx0a-002bd802.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BH4D0Ft002206
 for <samba-technical@lists.samba.org>; Fri, 17 Dec 2021 11:38:08 -0600
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2043.outbound.protection.outlook.com [104.47.74.43])
 by mx0a-002bd802.pphosted.com (PPS) with ESMTPS id 3cysekjvnb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <samba-technical@lists.samba.org>; Fri, 17 Dec 2021 11:38:07 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cETgLJOdD7YbyWTcZT9CKAgrO5BF74CayGQYd/fLm7NhAHvqKCpEnNStnUViXK6YmH9P0fQwmud9FKzfKe5eyGNHYEZ6q20dVy5Js1a5p0xVgUocYZfwIpzIwi2MZbK7etY1RtXjYFLzo3d2rnL+fo6ec6xebz6s8ZalSkVAckzeUGQXag2zH9bLEMw0HMu64pKRC21kiyyZs0op0SSgxg3UAMe0q5jBNwndHbHvc1MpPMTpBcOPajDJYbftSsAUOZP+zGbXf+NEeqemYx+VUOVZ6QKSrNHcP7UM3uTQSbn32m6R2Z/LUM5aSYUl1GgPLLnCXDFG0reBQR9cJsh5Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAycGYXVcrhNRHloDRpvaXMKo41ZaVFFBsM6yr5fchs=;
 b=IRPu8HmALfVJscUSQwVcChyVJo5eJl6xqqiX+8K3WJ8hE6Wh3SDTvjfKCRRdjT8v1+KJQu8QNIkhukv3UihQmeP0MgsLrFJu+9co4LH5BRViVnGJxnBH8D4+er870qa8e6P7CWNcrceGQNovJa/MfF5yyGg4Lc6uXrf7IMIfzA0J9vMElx+VxzEu09fHyy+1UCmzRYwl22vLlpSa5q0QbL8N0bZWa1rO8F70TUUmuXzxgYfVJAw20E/wyuAmVQYpayjRl0Xqtv9O0uuF0SXY3PUYtyCOI2EdDT69KUq/2zn3qiK8wg75ujLW5Lb/wBnddRDqTPk6YQdYzmGwo4ym/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=relativity.com; dmarc=pass action=none
 header.from=relativity.com; dkim=pass header.d=relativity.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=relativity.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAycGYXVcrhNRHloDRpvaXMKo41ZaVFFBsM6yr5fchs=;
 b=iPld1rqEfcyf1udW/j/rxNIhp6COm/dM/2koJ3IxIVI5EThJWte865nVGjGUChmvMUUmdfK39oK3xk+LMxtsIr+uP1u0J49hKkjPUcdQh3C/2EDcNdlBsJD5ld42fzLQz5FUdOWycG2Hl0em+UxvLFtj2fW8NP4L79Xw6l5aw+PnOK2ShMrIgD0I4pX1AP5aBZNiJ9ZsvC3VKou14SgY9enIw1b4NigwVyx4VDuEtwbfPElqfLzt2+RIe2tp/0piCCP3p45Q75mC9sVO4sF4NapxnAtdpgIzz8PKoSZl6meywEonCDdhXI0MI55KgqLsbG1zAroDgXFdFWz7eV5anA==
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8)
 by CH2PR12MB3655.namprd12.prod.outlook.com (2603:10b6:610:25::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Fri, 17 Dec
 2021 17:38:04 +0000
Received: from CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::8060:2641:e432:f243]) by CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::8060:2641:e432:f243%8]) with mapi id 15.20.4778.018; Fri, 17 Dec 2021
 17:38:04 +0000
CC: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
Thread-Topic: Duplicate SMB file_ids leading to Windows client cache poisoning
Thread-Index: AQHX8s1skt2HvqQI+USudQXcgG5VU6w27Job
Date: Fri, 17 Dec 2021 17:38:04 +0000
Message-ID: <CH2PR12MB42620A8A416BDF210D0631DC86789@CH2PR12MB4262.namprd12.prod.outlook.com>
References: <CAB5c7xp-zEwjcZSHfjL8YyWd_4y=K3HC3GSjAzvMoJR9aPOv6A@mail.gmail.com>
 <9bbb9a27-9100-9a61-50e3-bdc7ab0bab1a@samba.org>
 <CAB5c7xpys+Ch65-6v0qv6rtGonFcKkMKJRYEzOboiRfiOPLs4Q@mail.gmail.com>
 <a806f198-69d1-a836-b5d8-c1b7b37c4d87@samba.org>
 <CAB5c7xpBqoumBu_dX9N7eVY_vYUhu57Y+PDeT-S7jOs325GcyA@mail.gmail.com>
 <9ed4d4ed-155c-7740-854a-8819eb7bec91@samba.org>
 <YbOU84ZAt6FE81gb@jeremy-acer> <YbOlvjkCcbp41r0e@samba.org>
 <a58df604-6341-5a18-377f-8ff204ab53da@talpey.com>
 <20211214224045.GB15579@fieldses.org> <Ybu/PSnO1XNqWUCh@jeremy-acer>
In-Reply-To: <Ybu/PSnO1XNqWUCh@jeremy-acer>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 23591f49-913b-d1e7-576f-6650e8d50383
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ea31f3fb-e8e3-426b-01c8-08d9c183fad3
x-ms-traffictypediagnostic: CH2PR12MB3655:EE_
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam-message-info: N14xark0TMbgyOc68yI4l1wZqHo9iZnw8y0ZWbtC60JjSlgzlRaVt0tNSKJwhhmS+YhHLUtZ4zexg5pJA0ajv/144C+Z/UgRqz3RXhQlErclLk06lL9Vhop7QXFJc5ByNelv2r5rv6O6QAbDmuUszH8ukWjSin7T4lDtP/M5xvVGoS70kXJ9jUnYuMvSSgUAUAClcLPTmXsU/tO8AG5f1rhoJeBoqwiamA3Id4U9w1+G+CRRSi6iK2z3eS96H9NoDq21LukKhFixgbJT8+iWzlBNuhC5jRX4Pjcvt6hh9bS0sTX0VDQFA0aBQrTgPTeOnvJqle7xRA3wjyGcv4UpQ/DBUnHzAPN3VvJbEI5fgQ8D8p5L81BrDVIcq3SDhGQVI3B9/lhrP0aZ/C7cw9CHurdZ2LPNP+3sNQTca5xRjZsKnJsiuSq5k8dJrWFmjd7Qd+s97sqADfxlEXPO21T6sQ+xua0fVxPHXDH6q5e+LqN1fJ5TMrzxKSCl4yzo4yaHiXoBuGkKBE3enP21quUxmd5HZ87AhBo33EheBnR1d3odO0bHBJZzhjpzfXnrlIzi7zc9+ebmT/xoziWqXB3C6UIvWVxKyXoIEU47r2g0/K7dgvqTuOh7u0svYwRdpOMBJeXs2xuQIN9DR/lJbA5tmYvThSaiCM1IEKoQjUYd1YiWEbSXSTbo/hoBNeb5mypGI+fzhqlGXhBtzphcneFXyOTjNkIbjboo/tN9gJfXW+bZeATwtXBmv1K+C4hj9c1e7NqMPfSJSQ1k0tfSugDaf5SuOHNWsKLbRAiSDcG+0MQ=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?o+u+UCgwWiQS0lOI8M3iuEM7DIuPtXe6cYGlmvBlpmjkswT7CHKxalot9asW?=
 =?us-ascii?Q?6kbKgJyzICevuWi8LybBvnFaI+afOaeWY311vc5O/X3jO7BFeJAEn5064JiJ?=
 =?us-ascii?Q?ecfvaRX3D/vzAypFQU4lNGdF22rHSFAa9j5nEwEZuCOb+yGmSxK/20vPefx9?=
 =?us-ascii?Q?M+COxbpz8AChQpaS/IfTGZlYzky3jdGfAg71D++a9dxLgnFOnRox3Gozb6Uf?=
 =?us-ascii?Q?5r77MnOG9MexceJDiOz6YdjKupTPL9F+EGtc7H+cY49uDQwUehAeU7O81I7L?=
 =?us-ascii?Q?MRQu/aPmi4KPIcPqroqsvZneui1PrL0PJABRMlFCFSTzOLS5SUtRTKd+okVo?=
 =?us-ascii?Q?NUkhO/LWVsUCvYYqTqu+TYhLnpqUER9mDv5g7yIJgVlz3gT/V/OMLbcWYJN+?=
 =?us-ascii?Q?516FqEM1jjtcmy11i0Vt9JrsoeKMqcCrOGJypmigUQJzuN5THgC6hM2KX+1/?=
 =?us-ascii?Q?Ev23uH1GE7Hu26uuxYKxRftC1mIMNzc3BtAEA/IMWeUVu6ussQvSn+4q9SoM?=
 =?us-ascii?Q?WSrqtYqbCa2ie535+ntLKQF3LaSLs9d+J4lea9UpJKEFfg7sFYdhvxxcoKCE?=
 =?us-ascii?Q?qUfZ5/pR1pghllnNpUbuSKj3NbPRpvN/YXSiB4jSx4G12IyMGRCqZsUsup9e?=
 =?us-ascii?Q?dxALaBuaxvibjRoMqAtV1meNZ4VaKtswLAVVzrQNkGtj2eKD+bjI+apsaysr?=
 =?us-ascii?Q?QUzW7Gazba61uaPZWIqpfzxfDeYfQ49ZZM63iZooi61U9yKBWnvgeWglCEiN?=
 =?us-ascii?Q?2MSYYQ/jXrDPd3hO1OaE+vSi8pnLJgOpiqZ0r7c9KjvY8EwT29kEukr4CBBN?=
 =?us-ascii?Q?IUN1lt5h35DzP/DvapuoRbmGZ8V1WVGQeENt7R4wl+eQbGVPfDQPeEZi8QRH?=
 =?us-ascii?Q?BMvSTfnnBH/gB8uIZLJ/9eyr/a4tvdmnUk1Zi+pTpht2e7EiPzeldIQ7SHfF?=
 =?us-ascii?Q?CJs7LP+1rDe6Ji5HWLCVEIS5wedpHzvTYzbCm0RmZ6+kKFsG2KcVXGpIoVCo?=
 =?us-ascii?Q?+6owk3IDV5FTWcuWcc1JAg+uyU0op2nzpgk0qOiGLCqLUb0/feDqALCuF38t?=
 =?us-ascii?Q?9+tgOkoVIFyShnHEeXKdbNMTdjsjghpLgIgK+OTiZ5BhSowd1BuEeEk+hTnq?=
 =?us-ascii?Q?P0vzoJ+Yx+i+1MaShpHIZvaZL2j8N/WvnjBomXR3ZK7vF1lRcXzZvjb3XEUA?=
 =?us-ascii?Q?wswkNp7jVHgcqo888ZwMtG9Z/oSUsknWDpC3Yxz1Q3zXPw1mP3d7dTXinNx2?=
 =?us-ascii?Q?GZk1tQw+LCMHbfJuBCMm55DmRUlwdHHqVrbaK39ZoDxct70qZUFuLvLQVPXv?=
 =?us-ascii?Q?XxuSYCh/pGE+jS3x74EGFeFyQ4kdrpElhUpg0ieR/2PMWc6nfWqc6OAkSw77?=
 =?us-ascii?Q?EvJEZSPk89qiia3nOsOnOLkiBltFK6mv3HNpzz9FtrqY5SkI8Fqf5+UWiJGw?=
 =?us-ascii?Q?l6/CtMlIO2WMNgx41Nj7A4mSm0lmNAADfjgAKoOwnV7/iY/xzvBbzikwj/RK?=
 =?us-ascii?Q?ftCHk86SKkyT6MC3mvv9wu1jzpvZGFV0uhBwr/3RC4OqB5tmmdl2ycsUpHcX?=
 =?us-ascii?Q?RVn7BDMQP2CjF7F/m+EdwiUTO4Pd+TioTENGrcPv0FCH+RXTUQuse5lgpPpb?=
 =?us-ascii?Q?laCFD+yWJ2LEvi62ew3xeG+dh8//FTi+URGipGGd+4GoGa/S810hBOK/1aiM?=
 =?us-ascii?Q?aT+acg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: relativity.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4262.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea31f3fb-e8e3-426b-01c8-08d9c183fad3
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8afe73f9-0d93-4821-a898-c5c2dc320953
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZSlxZMnKWusYJVBv/XJdNv0WgybCVDd3EvAkxHzxba/IeB5vFj6xd+LJqondNRWhBHTVUofA2/2gC5EqujAJbPGT6IWPFDWjJUid5WKoW/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3655
X-Proofpoint-ORIG-GUID: 4zXRgjYoHYLAetNYxkujF7MtpH3ZDrJ-
X-Proofpoint-GUID: 4zXRgjYoHYLAetNYxkujF7MtpH3ZDrJ-
X-Proofpoint-Spam-Reason: orgsafe
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
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
From: Scott Rosenberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: Scott Rosenberg <scott.rosenberg@relativity.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi, first time emailing this list, so I hope this goes through as expected.=
 I helped track down the bad version initially (4.11.1)


I hesitate to suggest this, but:

Could it make sense to combine multiple flawed options to increase the effe=
ctive entropy?

For example:
time + inode number as opposed to use just one or the other?

Then it would only be an issue if:

client is mac
Inode is reused in the time resolution period


Scott Rosenberg | Relativity
Systems Engineer, FAST

relativity.com<https://www.relativity.com/>

________________________________
From: samba-technical <samba-technical-bounces@lists.samba.org> on behalf o=
f Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Sent: Thursday, December 16, 2021 4:35 PM
To: J. Bruce Fields <bfields@fieldses.org>
Cc: Tom Talpey <tom@talpey.com>; Andrew Walker <awalker@ixsystems.com>; Chr=
istof Schmitt <cs@samba.org>; samba-technical@lists.samba.org <samba-techni=
cal@lists.samba.org>; jra@samba.org <jra@samba.org>
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoni=
ng

On Tue, Dec 14, 2021 at 05:40:45PM -0500, J. Bruce Fields wrote:
>
>Even if you could: it's true that there's an i_generation in the generic
>struct inode, but I doubt there's any guarantee it meets your
>requirements (or is even initialized to anything at all) for a given
>filesystem.
>
>(Whereas if it were added to statx then the filesystem could choose to
>return it or not depending on whether it's supported.)

So to step back a bit, I think this only affects MacOSX clients.

I believe (Tom please correct me if I'm wrong) the Windows buffer
cache is based on pathname from the share root, not the reported fileid.

Also, I'm guessing that the buffer cache should not be preserved
over a connection loss. Or is it preserved if the client has a
persistent handle ?

So from the server side we have a 64-bit number we need to keep
constant over the lifetime of a particular file, and at least
for MacOSX clients we can't re-use any number even if the file
is deleted and re-created over the lifetime of a connection.

I'm just trying to scope out the exact issue we're trying
to solve.

Currently in Samba, we have a 64-bit fileid, which
we return via the following call in the VFS.

uint64_t fileid =3D SMB_VFS_FS_FILE_ID(conn, &stat_struct);

The default is:

vfswrap_fs_file_id(), which looks like:

static uint64_t vfswrap_fs_file_id(struct vfs_handle_struct *handle,
                                    const SMB_STRUCT_STAT *psbuf)
{
        uint64_t file_id;

         if (!(psbuf->st_ex_iflags & ST_EX_IFLAG_CALCULATED_FILE_ID)) {
                 return psbuf->st_ex_file_id;
         }

         if (handle->conn->base_share_dev =3D=3D psbuf->st_ex_dev) {
                 return (uint64_t)psbuf->st_ex_ino;
         }

         /* FileIDLow */
         file_id =3D ((psbuf->st_ex_ino) & UINT32_MAX);

         /* FileIDHigh */
         file_id |=3D ((uint64_t)((psbuf->st_ex_dev) & UINT32_MAX)) << 32;

         return file_id;
}

By default, when reading the stat info from a file,
st_ex_file_id is set directly from the inode number.

         st_ex_file_id =3D ex_ino;
         st_ex_iflags |=3D ST_EX_IFLAG_CALCULATED_FILE_ID;

and the flag ST_EX_IFLAG_CALCULATED_FILE_ID is set to
show this is a 'calculated from inode' fileid.

When smbd itself creates a file or directory, it calls:

                         file_id =3D make_file_id_from_itime(&smb_dname->st=
);
                         update_stat_ex_file_id(&smb_dname->st, file_id);

where make_file_id_from_itime() returns the immutable "birth time"
as the fileid, and update_stat_ex_file_id() does:

         st_ex_file_id =3D file_id;
         st_ex_iflags &=3D ~ST_EX_IFLAG_CALCULATED_FILE_ID;

so it clears the ST_EX_IFLAG_CALCULATED_FILE_ID flag,
meaning that vfswrap_fs_file_id() will directly return
st_ex_file_id (i.e. the immutable "birth time") as
the fileid.

These two calls (make_file_id_from_itime()/update_stat_ex_file_id())
are also done when smbd reads an extended attribute containing
a stored DOS attribute with the XATTR_DOSINFO_ITIME flag set,
meaning we always return the same fileid for a file with
a given birthtime.

This fixes the problem for MacOSX clients (in that
birthtime is always increasing as the arrow of time
marches on) but then fails for the case where the
birthtime timestamp resolution is so poor that two
files can end up with the same birthtime.

I'm thinking a tweak in the make_file_id_from_itime()
case must be the eventual fix here.

Still considering the right way to go about this...

